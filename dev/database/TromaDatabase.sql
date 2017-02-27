-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 22, 2016 at 09:50 PM
-- Server version: 5.6.28
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `troma_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `number` int(10) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zipcode` int(5) NOT NULL,
  `city` varchar(255) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Table structure for table `CareProgram`
--

CREATE TABLE `CareProgram` (
  `id` int(10) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `zone` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Table structure for table `CareProgramExercice`
--

CREATE TABLE `CareProgramExercice` (
  `careProgram` int(10) NOT NULL,
  `exercise` int(10) NOT NULL,
  `repetition` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Equipment`
--

CREATE TABLE `Equipment` (
  `id` int(10) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `parameter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `EquipmentExercise`
--

CREATE TABLE `EquipmentExercise` (
  `exercise` int(10) NOT NULL,
  `equipment` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ExerciceData`
--

CREATE TABLE `ExerciceData` (
  `date` datetime NOT NULL,
  `patient` int(10) NOT NULL,
  `exercise` int(10) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stopTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `skipped` tinyint(1) NOT NULL,
  `feedback` int(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Exercise`
--

CREATE TABLE `Exercise` (
  `id` int(10) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `zone` int(2) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `frequencyType` varchar(255) DEFAULT NULL,
  `frequency` int(10) DEFAULT NULL,
  `manVideoPath` varchar(512) DEFAULT NULL,
  `womanVideoPath` varchar(512) DEFAULT NULL,
  `type` enum('stretching','reinforcing','mobility') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `id` int(10) NOT NULL ,
  `user` int(10) NOT NULL,
  `physio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PatientCareProgram`
--

CREATE TABLE `PatientCareProgram` (
  `patient` int(10) NOT NULL,
  `careProgram` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PatientExerciceCareProgram`
--

CREATE TABLE `PatientExerciceCareProgram` (
  `patient` int(10) NOT NULL,
  `exercise` int(10) NOT NULL,
  `careProgram` int(10) NOT NULL,
  `unite` enum('jour','semaine') NOT NULL,
  `frequency` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PatientExercise`
--

CREATE TABLE `PatientExercise` (
  `patient` int(10) NOT NULL,
  `exercise` int(10) NOT NULL,
  `repetition` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Physio`
--

CREATE TABLE `Physio` (
  `id` int(10) NOT NULL ,
  `user` int(10) NOT NULL,
  `right` enum('basic','premium','deus') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int(10) NOT NULL ,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `accountType` enum('professionel','patient') NOT NULL,
  `address` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `Address`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `CareProgram`
--
ALTER TABLE `CareProgram`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `CareProgram`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `CareProgramExercice`
--
ALTER TABLE `CareProgramExercice`
  ADD PRIMARY KEY (`careProgram`,`exercise`),
  ADD KEY `FKExerciceCPE` (`exercise`);

--
-- Indexes for table `Equipment`
--
ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `Equipment`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `EquipmentExercise`
--
ALTER TABLE `EquipmentExercise`
  ADD PRIMARY KEY (`exercise`,`equipment`),
  ADD KEY `FKEquipmentEE` (`equipment`);

--
-- Indexes for table `ExerciceData`
--
ALTER TABLE `ExerciceData`
  ADD PRIMARY KEY (`date`,`patient`,`exercise`),
  ADD KEY `FKExerciceED` (`exercise`),
  ADD KEY `FKEPatientED` (`patient`);

--
-- Indexes for table `Exercise`
--
ALTER TABLE `Exercise`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `Exercise`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKUserPatient` (`user`),
  ADD KEY `FKPhysioPatient` (`physio`);

  ALTER TABLE `Patient`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `PatientCareProgram`
--
ALTER TABLE `PatientCareProgram`
  ADD PRIMARY KEY (`patient`,`careProgram`),
  ADD KEY `FKProgramCPP` (`careProgram`);

--
-- Indexes for table `PatientExerciceCareProgram`
--
ALTER TABLE `PatientExerciceCareProgram`
  ADD PRIMARY KEY (`patient`,`careProgram`,`exercise`),
  ADD KEY `FKExercicePECP` (`exercise`),
  ADD KEY `FKCareProgramPECP` (`careProgram`);

--
-- Indexes for table `PatientExercise`
--
ALTER TABLE `PatientExercise`
  ADD PRIMARY KEY (`patient`,`exercise`),
  ADD KEY `FKExercisePE` (`exercise`);

--
-- Indexes for table `Physio`
--
ALTER TABLE `Physio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKUserPhysio` (`user`);

  ALTER TABLE `Physio`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKAddressUser` (`address`);

  ALTER TABLE `User`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CareProgramExercice`
--
ALTER TABLE `CareProgramExercice`
  ADD CONSTRAINT `FKExerciceCPE` FOREIGN KEY (`exercise`) REFERENCES `Exercise` (`id`),
  ADD CONSTRAINT `FKProgramPCE` FOREIGN KEY (`careProgram`) REFERENCES `CareProgram` (`id`);

--
-- Constraints for table `EquipmentExercise`
--
ALTER TABLE `EquipmentExercise`
  ADD CONSTRAINT `FKEquipmentEE` FOREIGN KEY (`equipment`) REFERENCES `Equipment` (`id`),
  ADD CONSTRAINT `FKExerciceEE` FOREIGN KEY (`exercise`) REFERENCES `Exercise` (`id`);

--
-- Constraints for table `ExerciceData`
--
ALTER TABLE `ExerciceData`
  ADD CONSTRAINT `FKEPatientED` FOREIGN KEY (`patient`) REFERENCES `Patient` (`id`),
  ADD CONSTRAINT `FKExerciceED` FOREIGN KEY (`exercise`) REFERENCES `Exercise` (`id`);

--
-- Constraints for table `Patient`
--
ALTER TABLE `Patient`
  ADD CONSTRAINT `FKPhysioPatient` FOREIGN KEY (`physio`) REFERENCES `Physio` (`id`),
  ADD CONSTRAINT `FKUserPatient` FOREIGN KEY (`user`) REFERENCES `User` (`id`);

--
-- Constraints for table `PatientCareProgram`
--
ALTER TABLE `PatientCareProgram`
  ADD CONSTRAINT `FKPatientCPP` FOREIGN KEY (`patient`) REFERENCES `Patient` (`id`),
  ADD CONSTRAINT `FKProgramCPP` FOREIGN KEY (`careProgram`) REFERENCES `CareProgram` (`id`);

--
-- Constraints for table `PatientExerciceCareProgram`
--
ALTER TABLE `PatientExerciceCareProgram`
  ADD CONSTRAINT `FKCareProgramPECP` FOREIGN KEY (`careProgram`) REFERENCES `CareProgram` (`id`),
  ADD CONSTRAINT `FKExercicePECP` FOREIGN KEY (`exercise`) REFERENCES `Exercise` (`id`),
  ADD CONSTRAINT `FKPatientePECP` FOREIGN KEY (`patient`) REFERENCES `Patient` (`id`);

--
-- Constraints for table `PatientExercise`
--
ALTER TABLE `PatientExercise`
  ADD CONSTRAINT `FKExercisePE` FOREIGN KEY (`exercise`) REFERENCES `Exercise` (`id`),
  ADD CONSTRAINT `FKPatientPE` FOREIGN KEY (`patient`) REFERENCES `Patient` (`id`);

--
-- Constraints for table `Physio`
--
ALTER TABLE `Physio`
  ADD CONSTRAINT `FKUserPhysio` FOREIGN KEY (`user`) REFERENCES `User` (`id`);

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `FKAddressUser` FOREIGN KEY (`address`) REFERENCES `Address` (`id`);
