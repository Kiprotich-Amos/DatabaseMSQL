CREATE DATABASE chemosi;
CREATE TABLE University(
    uni_Cod VARCHAR(255) NOT NULL,
    uni_N VARCHAR(255),
    uni_Loc VARCHAR(255),
    uni_Con VARCHAR(255),
    uni_Add VARCHAR(255),
    uni_Desc VARCHAR(255),
    PRIMARY KEY(uni_Cod)
); CREATE TABLE Faculty(
    fac_code INT NOT NULL AUTO_INCREMENT,
    fac_N VARCHAR(255),
    fac_M VARCHAR(255),
    fac_V VARCHAR(255),
    uni_Cod VARCHAR(255),
    PRIMARY KEY(fac_code),
    FOREIGN KEY(uni_Cod) REFERENCES University(uni_Cod)
); CREATE TABLE Department(
    dep_Code INT NOT NULL AUTO_INCREMENT,
    dep_N VARCHAR(255),
    dep_S VARCHAR(255),
    PRIMARY KEY(dep_Code),
    fac_code INT,
    FOREIGN KEY(fac_code) REFERENCES Faculty(fac_code)
);
CREATE TABLE Units(
    course_code VARCHAR(255) NOT NULL,
    course_tittle VARCHAR(255),
    semestar INT,
    PRIMARY KEY(course_code)
);
 CREATE TABLE Programme(
    prog_code VARCHAR(255) NOT NULL,
    prog_N VARCHAR(255),
    dep_Code INT,
    course_code VARCHAR(255),
    PRIMARY KEY(prog_code),
    FOREIGN KEY(course_code) REFERENCES Units(course_code),
    FOREIGN KEY(dep_Code) REFERENCES Department(dep_Code),
    UNIQUE (course_code, dep_Code)
); 
 CREATE TABLE Student(
    sd_Reg VARCHAR(255) NOT NULL,
    sd_N VARCHAR(255),
    prog_Admm VARCHAR(255) NOT NULL,
    sd_C VARCHAR(255),
    prog_code VARCHAR(255),
    dep_Code INT,
    PRIMARY KEY(sd_Reg),
    FOREIGN KEY(prog_code) REFERENCES Programme(prog_code),
    UNIQUE (sd_Reg, prog_code)
); 
CREATE TABLE Parents(
    prnt_Id INT NOT NULL AUTO_INCREMENT,
    prnt_N VARCHAR(255),
    prnt_Con VARCHAR(255),
    prog_code INT,
    PRIMARY KEY(prnt_Id),
    sd_Reg VARCHAR(255),
    FOREIGN KEY(sd_Reg) REFERENCES Student(sd_Reg)
);
 CREATE TABLE Zone(
    zn_Id INT NOT NULL AUTO_INCREMENT,
    zn_dep VARCHAR(255),
    zn_Loc VARCHAR(255),
    PRIMARY KEY(zn_Id)
); CREATE TABLE School(
    sch_Id int NOT NULL AUTO_INCREMENT,
    sch_N VARCHAR(255),
    sch_comb VARCHAR(255),
    sch_d_rp VARCHAR(255),
    zn_Id INT,
    PRIMARY KEY(sch_Id),
    FOREIGN KEY(zn_Id) REFERENCES Zone(zn_Id)
); 
CREATE TABLE Placement(
    plc_Id INT NOT NULL ,
    sd_Reg VARCHAR(255),
    sch_Id INT,
    FOREIGN KEY(sd_Reg) REFERENCES Student(sd_Reg),
    FOREIGN KEY(sch_Id) REFERENCES School(sch_Id),
    UNIQUE (sd_Reg, sch_Id)
);