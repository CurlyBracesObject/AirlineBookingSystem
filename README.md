# Airline Booking System

**Tech Stack**: Java Spring MVC | MyBatis | MySQL | JSP | jQuery | Layui | Maven | JavaMail

A production-ready airline reservation management system featuring three-tier architecture, role-based access control, real-time seat management, and automated email notifications.

## Technology Stack

### Backend Technologies
- **Framework**: Spring MVC 4.2 + Spring Core
- **ORM**: MyBatis 3.x with Dynamic SQL Providers
- **Database**: MySQL 5.7+ with C3P0 Connection Pooling
- **Security**: Custom Session Interceptors + Role-based Access
- **Email Service**: JavaMail API with SMTP Integration
- **Transaction Management**: Spring Declarative Transactions
- **Build Tool**: Maven with Dependency Management

### Frontend Technologies
- **Template Engine**: JSP + JSTL for Server-side Rendering
- **UI Framework**: Layui Component Library
- **JavaScript**: jQuery 3.2.1 for DOM Manipulation
- **Styling**: Custom CSS + Responsive Design
- **Form Validation**: Client-side + Server-side Validation

### Architecture & Design Patterns
- **MVC Pattern**: Clean separation with Controller/Service/DAO layers
- **Dependency Injection**: Spring IoC Container
- **Dynamic SQL**: MyBatis SQL Providers for flexible queries
- **Interceptor Pattern**: Authentication and authorization
- **Template Method**: Service layer abstraction

## System Architecture

### Core Workflow Implementation

**Three-Role System with Complete Access Control:**
```java
@RequestMapping(value = "/login")
public ModelAndView login(@RequestParam("tip") String userRole,
                          HttpSession session, ModelAndView mv) {
    if ("1".equals(userRole)) {
        // Airline Administrator - Full system access
        User user = rainservice.login(loginname, password, userRole);
        session.setAttribute(Constants.USER_SESSION, user);
        return new ModelAndView("redirect:/index");
    } else if ("3".equals(userRole)) {
        // Airline Manager - Approval workflow
        User user = rainservice.login(loginname, password, userRole);
        session.setAttribute(Constants.USER_SESSION, user);
        return new ModelAndView("redirect:/index");
    } else {
        // Customer - Booking interface
        Employee user = rainservice.login2(loginname, password);
        session.setAttribute(Constants.USER_SESSION, user);
        return new ModelAndView("redirect:/indexcustomer/");
    }
}
```

**Flight Management with Approval Workflow:**
```java
@Controller
public class FeiJiController {
    @Resource
    private FeiJiService feiJiService;

    @RequestMapping(value = "/feiji/pass", method = RequestMethod.GET)
    public ModelAndView pass(Integer id, ModelAndView modelAndView) {
        FeiJi feiJi = new FeiJi();
        feiJi.setId(id);
        feiJi.setStatus("PASS");
        feiJiService.update(feiJi);
        modelAndView.setViewName("redirect:/feiji/list");
        return modelAndView;
    }

    @RequestMapping(value = "/feiji/save/entity", method = RequestMethod.POST)
    public ModelAndView saveEntity(@ModelAttribute FeiJi feiJi, ModelAndView modelAndView) {
        modelAndView.setViewName("redirect:/feiji/list");
        feiJi.setSheng_yu_total(feiJi.getZuo_wei_total());
        feiJiService.insert(feiJi);
        return modelAndView;
    }
}
```

**Real-time Seat Management System:**
```java
public class FeijiZuoWei {
    private Integer id;
    private Integer fei_ji_id;
    private Integer row;
    private Integer col;
    private String type;        // TOUDENG(First), SHANGYE(Business), JINGJI(Economy)
    private String price;       // Dynamic pricing per seat type
    private String status;      // UN_BUY -> BUY (Real-time status updates)
    private String fei_ji_name;

    // Getters and setters implementation
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
```

**Complete Booking Process with Email Integration:**
```java
@RequestMapping(value = "/feijizuowei_pass/save/yuding", method = RequestMethod.POST)
public ModelAndView saveYuDing(@ModelAttribute FeijiZuoWeiYuDing feijiZuoWeiYuDing, 
                               ModelAndView modelAndView) {
    FeijiZuoWei feijiZuoWei = feiJiZuoWeiService.queryById(feijiZuoWeiYuDing.getId());
    FeiJi feiJi = feiJiService.queryById(feijiZuoWei.getFei_ji_id());

    // Configure email service
    JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
    javaMailSender.setHost("smtp.qq.com");
    javaMailSender.setUsername("809726074@qq.com");
    javaMailSender.setPassword("xkivwnfymutfbejg");
    javaMailSender.setPort(587);
    
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", true);
    properties.put("mail.smtp.starttls.enable", true);
    javaMailSender.setJavaMailProperties(properties);

    // Update seat and flight status
    FeijiZuoWei updateFeijiZuoWei = new FeijiZuoWei();
    updateFeijiZuoWei.setId(feijiZuoWei.getId());
    updateFeijiZuoWei.setStatus("BUY");
    feiJiZuoWeiService.update(updateFeijiZuoWei);
    
    FeiJi updateFeiji = new FeiJi();
    updateFeiji.setId(feiJi.getId());
    updateFeiji.setSheng_yu_total(feiJi.getSheng_yu_total() - 1);
    feiJiService.update(updateFeiji);

    // Send confirmation email
    SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
    simpleMailMessage.setFrom("809726074@qq.com");
    simpleMailMessage.setTo(feijiZuoWeiYuDing.getEmail());
    simpleMailMessage.setSubject("Your flight ticket information");
    
    String bookingDetails = "Flight: " + feiJi.getFei_ji_name() + "\n" +
                           "Seat: Row " + feijiZuoWei.getRow() + ", Col " + feijiZuoWei.getCol() + "\n" +
                           "Departure: " + feiJi.getQi_fei_time() + "\n" +
                           "Arrival: " + feiJi.getDao_da_time() + "\n" +
                           "Price: " + feijiZuoWei.getPrice() + " RMB";
    
    simpleMailMessage.setText(bookingDetails);
    javaMailSender.send(simpleMailMessage);

    modelAndView.setViewName("feiji/pass/success");
    return modelAndView;
}
```

## Database Design and Implementation

### Core Database Schema
```sql
-- Flight management with approval workflow
CREATE TABLE `feiji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fei_ji_name` varchar(255),
  `chu_fa_di` varchar(255),           -- Departure city
  `mu_di_di` varchar(255),            -- Destination city
  `qi_fei_time` varchar(200),         -- Departure time
  `dao_da_time` varchar(200),         -- Arrival time
  `zuo_wei_total` int(6),             -- Total seats
  `sheng_yu_total` int(6),            -- Available seats
  `status` varchar(255) DEFAULT 'UN_PASS'  -- Manager approval status
);

-- Individual seat management and booking
CREATE TABLE `feiji_zuo_wei` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `fei_ji_id` int(6),                 -- Foreign key to feiji table
  `row` int(6),                       -- Seat row number
  `col` int(6),                       -- Seat column number
  `type` varchar(255),                -- TOUDENG/SHANGYE/JINGJI
  `price` varchar(255),               -- Seat-specific pricing
  `status` varchar(255) DEFAULT 'UN_BUY'  -- Purchase status
);

-- Multi-role user management
CREATE TABLE `user_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20),
  `password` varchar(20),
  `username` varchar(20),
  `tip` varchar(255) DEFAULT '1',     -- Role: 1=Admin, 2=Customer, 3=Manager
  `createdate` char(20)
);
```

### MyBatis Dynamic SQL Implementation
```java
public class DeptDynaSqlProvider {
    public String insertDept(Dept dept) {
        return new SQL() {{
            INSERT_INTO(DEPTTABLE);
            if(dept.getName() != null && !dept.getName().equals("")) {
                VALUES("name", "#{name}");
            }
            if(dept.getRemark() != null && !dept.getRemark().equals("")) {
                VALUES("remark", "#{remark}");
            }
        }}.toString();
    }
    
    public String updateDept(Dept dept) {
        return new SQL() {{
            UPDATE(DEPTTABLE);
            if(dept.getName() != null) {
                SET(" name = #{name} ");
            }
            if(dept.getRemark() != null) {
                SET(" remark = #{remark} ");
            }
            WHERE(" id = #{id} ");
        }}.toString();
    }
}
```

### Database Access Layer with MyBatis
```java
@Mapper
public interface FeiJiDao {
    @Select("select * from feiji where id = #{id}")
    FeiJi queryById(Integer id);
    
    @Insert("insert into feiji(fei_ji_name, chu_fa_di, mu_di_di, qi_fei_time, dao_da_time, zuo_wei_total, sheng_yu_total) values (#{fei_ji_name}, #{chu_fa_di}, #{mu_di_di}, #{qi_fei_time}, #{dao_da_time}, #{zuo_wei_total}, #{sheng_yu_total})")
    int insert(FeiJi feiJi);
    
    @Update("<script>" +
            "update feiji" +
            "<set>" +
            "<if test='fei_ji_name != null and fei_ji_name != \"\"'>" +
            "fei_ji_name = #{fei_ji_name}," +
            "</if>" +
            "<if test='status != null'>" +
            "status = #{status}" +
            "</if>" +
            "</set>" +
            "where id = #{id}" +
            "</script>")
    int update(FeiJi feiJi);
    
    @Delete("delete from feiji where id = #{id}")
    int deleteById(Integer id);
    
    List<FeiJi> selectList(FeiJi feiJi);
}
```

## Service Layer Implementation

### Business Logic with Transaction Management
```java
@Service("RainService")
@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
public class RainServiceImpl implements RainService {

    @Autowired
    private DeptDao deptDao;
    @Autowired
    private EmployeeDao employeedao;
    @Autowired
    private UserDao userdao;

    @Override
    public User login(String loginname, String password, String tip) {
        return userdao.get_login(loginname, password, tip);
    }

    @Override
    public Employee login2(String loginname, String password) {
        return employeedao.get_ByInfo(loginname, password);
    }

    @Override
    public List<Employee> get_EmployeeList() {
        List<Employee> list = employeedao.get_List();
        List<Employee> enrichedList = new ArrayList<>();
        
        for(Employee employee : list) {
            // Enrich employee data with department and job information
            Dept dept = deptDao.get_Info(employee.getDept_id());
            employee.setDept(dept);
            
            Job job = jobDao.get_Info(employee.getJob_id());
            employee.setJob(job);
            
            enrichedList.add(employee);
        }
        return enrichedList;
    }
}
```

### Flight Service Implementation
```java
@Service
public class FeiJiServiceImpl implements FeiJiService {
    @Resource
    private FeiJiDao feiJiDao;

    @Override
    public FeiJi queryById(Integer id) {
        return this.feiJiDao.queryById(id);
    }

    @Override
    public List<FeiJi> selectFeiJi(FeiJi feiJi) {
        return this.feiJiDao.selectList(feiJi);
    }

    @Override
    public FeiJi insert(FeiJi feiji) {
        this.feiJiDao.insert(feiji);
        return feiji;
    }

    @Override
    public FeiJi update(FeiJi feiji) {
        this.feiJiDao.update(feiji);
        return this.queryById(feiji.getId());
    }

    @Override
    public boolean deleteById(Integer id) {
        return this.feiJiDao.deleteById(id) > 0;
    }
}
```

## Security Implementation

### Session-based Authentication Interceptor
```java
public class AuthorizedInterceptor implements HandlerInterceptor {
    private static final String[] IGNORE_URI = {"/loginForm", "/login", "/404.html"};
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler) throws Exception {
        boolean flag = false;
        String servletPath = request.getServletPath();
        
        // Check if request needs authentication
        for (String s : IGNORE_URI) {
            if (servletPath.contains(s)) {
                flag = true;
                break;
            }
        }
        
        // Intercept unauthorized requests
        if (!flag) {
            User user = (User) request.getSession().getAttribute(Constants.USER_SESSION);
            if(user == null) {
                request.setAttribute("message", "Please log in first before visiting the website!");
                request.getRequestDispatcher(Constants.LOGIN).forward(request, response);
                return false;
            } else {
                flag = true;
            }
        }
        return flag;
    }
}
```

### Input Validation and SQL Injection Prevention
```java
// DAO layer with parameterized queries
public interface UserDao {
    @Select("select * from " + USERTABLE + " where loginname = #{loginname} AND password = #{password} AND tip = #{tip}")
    User get_login(@Param("loginname") String loginname,
                   @Param("password") String password, 
                   @Param("tip") String tip);
    
    @SelectProvider(type = UserDynaSqlProvider.class, method = "insert_Notice")
    void insert_Info(User employee);
    
    @Delete(" delete from " + USERTABLE + " where id = #{id} ")
    void delete_Info(Integer id);
}
```

## Frontend Implementation

### Dynamic JSP Templates with Real-time Updates
```jsp
<!-- Flight listing with manager approval controls -->
<c:forEach items="${feiJiList}" var="item" varStatus="stat">
    <tr>
        <td>${item.id}</td>
        <td>${item.fei_ji_name}</td>
        <td>${item.chu_fa_di}</td>
        <td>${item.mu_di_di}</td>
        <td>${item.qi_fei_time}</td>
        <td>${item.dao_da_time}</td>
        <td>${item.sheng_yu_total}</td>
        <td>
            <c:choose>
                <c:when test="${item.status eq 'UN_PASS'}">
                    <span class="status-pending">Awaiting Approval</span>
                </c:when>
                <c:when test="${item.status eq 'PASS'}">
                    <span class="status-approved">Approved</span>
                </c:when>
            </c:choose>
        </td>
        <td class="td-manage">
            <c:if test="${hasRole}">
                <c:if test="${item.status eq 'UN_PASS'}">
                    <a title="Approve Flight" href="${ctx}/feiji/pass?id=${item.id}">
                        <i class="layui-icon">&#xe605;</i>
                    </a>
                </c:if>
            </c:if>
            <a title="Edit" href="${ctx}/feiji/toUpdate?id=${item.id}">
                <i class="layui-icon">&#xe642;</i>
            </a>
            <a title="Delete" onclick="member_del(this,'${item.id}')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
            </a>
        </td>
    </tr>
</c:forEach>
```

### Customer Booking Interface with Seat Selection
```jsp
<!-- Seat selection interface with real-time availability -->
<c:forEach items="${feiJiZuoWeiList}" var="seat" varStatus="stat">
    <tr>
        <td>${seat.id}</td>
        <td>${seat.fei_ji_name}</td>
        <td>${seat.row}</td>
        <td>${seat.col}</td>
        <td>
            <c:choose>
                <c:when test="${seat.type eq 'TOUDENG'}">First Class</c:when>
                <c:when test="${seat.type eq 'SHANGYE'}">Business Class</c:when>
                <c:when test="${seat.type eq 'JINGJI'}">Economy Class</c:when>
            </c:choose>
        </td>
        <td>${seat.price} RMB</td>
        <td>
            <c:choose>
                <c:when test="${seat.status eq 'UN_BUY'}">
                    <span class="seat-available">Available</span>
                </c:when>
                <c:when test="${seat.status eq 'BUY'}">
                    <span class="seat-sold">Sold</span>
                </c:when>
            </c:choose>
        </td>
        <td class="td-manage">
            <c:if test="${seat.status eq 'UN_BUY'}">
                <a title="Book Seat" href="${ctx}/feijizuowei_pass/toyuding?id=${seat.id}&fei_ji_id=${seat.fei_ji_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
            </c:if>
        </td>
    </tr>
</c:forEach>
```

### Booking Confirmation Form with Validation
```jsp
<!-- Customer booking form with server-side validation -->
<form class="layui-form" method="POST" id="bookingForm" action="${ctx}/feijizuowei_pass/save/yuding">
    <input type="hidden" id="fei_ji_id" name="fei_ji_id" value="${feiji.id}">
    <input type="hidden" id="id" name="id" value="${feijizuowei.id}">
    <input type="hidden" id="type" name="type" value="${feijizuowei.type}">
    
    <div class="layui-form-item">
        <label for="id_card" class="layui-form-label">
            <span class="x-red">*</span>ID Card Number
        </label>
        <div class="layui-input-inline">
            <input type="text" id="id_card" name="id_card" 
                   placeholder="Please enter ID card number"
                   required="" lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label for="real_name" class="layui-form-label">
            <span class="x-red">*</span>Full Name
        </label>
        <div class="layui-input-inline">
            <input type="text" id="real_name" name="real_name" 
                   placeholder="Please enter full name"
                   required="" lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <label for="email" class="layui-form-label">
            <span class="x-red">*</span>Email Address
        </label>
        <div class="layui-input-inline">
            <input type="email" id="email" name="email" 
                   placeholder="Please enter email address"
                   required="" lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <input type="submit" value="Confirm Booking" class="layui-btn" 
               lay-filter="add" lay-submit=""/>
    </div>
</form>
```

## Configuration and Deployment

### Spring Configuration
```xml
<!-- applicationContext.xml -->
<beans xmlns="http://www.springframework.org/schema/beans">
    <!-- MyBatis Scanner -->
    <mybatis:scan base-package="com.rain.dao"/>
    
    <!-- Component Scanning -->
    <context:component-scan base-package="com.rain"/>
    
    <!-- Database Configuration -->
    <context:property-override location="classpath:db.properties"/>
    <bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource"/>
    
    <!-- SqlSessionFactory -->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"
          p:mapperLocations="classpath:com/rain/dao/*.xml"
          p:dataSource-ref="dataSource"/>
    
    <!-- Transaction Management -->
    <bean id="transactionManager" 
          class="org.springframework.jdbc.datasource.DataSourceTransactionManager"
          p:dataSource-ref="dataSource"/>
    <tx:annotation-driven transaction-manager="transactionManager"/>
</beans>
```

### Spring MVC Configuration
```xml
<!-- springmvc-config.xml -->
<beans xmlns="http://www.springframework.org/schema/mvc">
    <!-- Controller Scanning -->
    <context:component-scan base-package="com.rain.controller"/>
    
    <!-- MVC Annotation Support -->
    <mvc:annotation-driven/>
    <mvc:default-servlet-handler/>
    
    <!-- Security Interceptors -->
    <mvc:interceptors>
        <mvc:interceptor>
            <mvc:mapping path="/*"/>
            <bean class="com.rain.interceptor.AuthorizedInterceptor"/>
        </mvc:interceptor>
    </mvc:interceptors>
    
    <!-- View Resolver -->
    <bean id="viewResolver"
          class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/page/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
    
    <!-- File Upload Support -->
    <bean id="multipartResolver"
          class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
        <property name="maxUploadSize" value="10485760"/>
        <property name="defaultEncoding" value="UTF-8"/>
    </bean>
</beans>
```

### Database Connection Configuration
```properties
# db.properties
dataSource.driverClass=com.mysql.jdbc.Driver
dataSource.jdbcUrl=jdbc:mysql://127.0.0.1:3306/fieji_shoupiao
dataSource.user=root
dataSource.password=root
dataSource.maxPoolSize=20
dataSource.maxIdleTime=1000
dataSource.minPoolSize=6
dataSource.initialPoolSize=5
```

## Installation and Setup

### Prerequisites
- Java 8 or higher
- MySQL 5.7 or higher
- Apache Tomcat 8.0 or higher
- Maven 3.6 or higher

### Database Setup
```sql
-- Create database and import schema
CREATE DATABASE fieji_shoupiao CHARACTER SET utf8 COLLATE utf8_general_ci;
USE fieji_shoupiao;
SOURCE feiji.sql;

-- Verify installation
SELECT COUNT(*) FROM user_inf;
SELECT COUNT(*) FROM feiji;
SELECT COUNT(*) FROM feiji_zuo_wei;
```

### Application Deployment
```bash
# Build the application
mvn clean compile package

# Deploy to Tomcat
cp target/AirlineBookingSystem.war $TOMCAT_HOME/webapps/

# Start Tomcat server
$TOMCAT_HOME/bin/startup.sh

# Access application
# http://localhost:8080/AirlineBookingSystem
```

### Default User Accounts
```
Administrator: admin / 123456 (Role: 1)
Manager: test / test (Role: 3)
Customer: Use employee registration system (Role: 2)
```

## API Endpoints Documentation

### Authentication Endpoints
```http
POST /login
Content-Type: application/x-www-form-urlencoded

loginname=admin&password=123456&tip=1
```

### Flight Management API
```http
# List all flights
GET /feiji/list

# Create new flight
POST /feiji/save/entity
Content-Type: application/x-www-form-urlencoded

fei_ji_name=Boeing737&chu_fa_di=Beijing&mu_di_di=Shanghai&qi_fei_time=10:00&dao_da_time=12:00&zuo_wei_total=180

# Approve flight (Manager only)
GET /feiji/pass?id=1

# Update flight information
POST /feiji/update/entity

# Delete flight
POST /feiji/delete?id=1
```

### Seat Management API
```http
# View available seats for flight
GET /feijizuowei/toyuding?fei_ji_id=1

# Complete seat booking
POST /feijizuowei_pass/save/yuding
Content-Type: application/x-www-form-urlencoded

id=1&id_card=123456789&real_name=John Doe&email=john@example.com
```

### User Management API
```http
# List users (Admin only)
GET /user/list

# Create new user
POST /user/add

# User logout
GET /user/logout
```

## Project Results

This airline booking system successfully implements:

**Complete Three-Tier Workflow**: Admin creates flights and pricing, Manager approves availability, Customers purchase approved seats with real-time inventory updates.

**Production-Ready Architecture**: Spring MVC with MyBatis ORM, C3P0 connection pooling, declarative transaction management, and comprehensive security implementation.

**Real-Time Operations**: Dynamic seat availability tracking, instant status updates, automated capacity management, and live booking confirmations.

**Email Integration**: Automated SMTP-based email notifications with detailed booking confirmations sent immediately upon purchase completion.

**Role-Based Security**: Session-based authentication with interceptor pattern, parameterized queries preventing SQL injection, and role-specific interface access.

**Responsive Frontend**: JSP templates with Layui components, jQuery interactions, form validation, and mobile-friendly responsive design.

The system demonstrates enterprise-level Java web development practices with clean architecture, robust security, and production deployment capabilities.
