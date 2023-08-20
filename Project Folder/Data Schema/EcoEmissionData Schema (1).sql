CREATE TABLE `organizations` (
  `id` INTEGER PRIMARY KEY,
  `name` VARCHAR,
  `location` VARCHAR,
  `contact_email` VARCHAR,
  `contact_phone` VARCHAR,
  `industry` VARCHAR,
  `website` VARCHAR,
  `registration_number` VARCHAR,
  `founding_year` INTEGER,
  `size` VARCHAR,
  `ownership_type` VARCHAR,
  `headquarters_location` VARCHAR,
  `parent_company` VARCHAR,
  `social_media_links` TEXT
);

CREATE TABLE `reporting_periods` (
  `id` INTEGER PRIMARY KEY,
  `year` INTEGER,
  `month` INTEGER
);

CREATE TABLE `emission_and_consumption_data` (
  `id` INTEGER PRIMARY KEY,
  `organization_id` INTEGER,
  `reporting_period_id` INTEGER,
  `product_name` VARCHAR,
  `scope1_emissions` DECIMAL,
  `scope2_emissions` DECIMAL,
  `scope3_emissions` DECIMAL,
  `net_energy_consumed` DECIMAL,
  `data_quality_flag` VARCHAR
);

CREATE TABLE `energy_consumption` (
  `id` INTEGER PRIMARY KEY,
  `emission_and_consumption_data_id` INTEGER,
  `electricity_consumption` DECIMAL,
  `natural_gas_consumption` DECIMAL,
  `fuel_oil_consumption` DECIMAL,
  `coal_consumption` DECIMAL,
  `renewable_energy_consumption` DECIMAL,
  `other_energy_sources_consumption` DECIMAL,
  `energy_cost` DECIMAL,
  `energy_source_details` TEXT
);

CREATE TABLE `scope1_emissions` (
  `id` INTEGER PRIMARY KEY,
  `emission_and_consumption_data_id` INTEGER,
  `variable_name` VARCHAR,
  `variable_value` DECIMAL
);

CREATE TABLE `scope2_emissions` (
  `id` INTEGER PRIMARY KEY,
  `emission_and_consumption_data_id` INTEGER,
  `variable_name` VARCHAR,
  `variable_value` DECIMAL
);

CREATE TABLE `scope3_emissions` (
  `id` INTEGER PRIMARY KEY,
  `emission_and_consumption_data_id` INTEGER,
  `variable_name` VARCHAR,
  `variable_value` DECIMAL
);

ALTER TABLE `emission_and_consumption_data` ADD FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

ALTER TABLE `emission_and_consumption_data` ADD FOREIGN KEY (`reporting_period_id`) REFERENCES `reporting_periods` (`id`);

ALTER TABLE `energy_consumption` ADD FOREIGN KEY (`emission_and_consumption_data_id`) REFERENCES `emission_and_consumption_data` (`id`);

ALTER TABLE `scope1_emissions` ADD FOREIGN KEY (`emission_and_consumption_data_id`) REFERENCES `emission_and_consumption_data` (`id`);

ALTER TABLE `scope2_emissions` ADD FOREIGN KEY (`emission_and_consumption_data_id`) REFERENCES `emission_and_consumption_data` (`id`);

ALTER TABLE `scope3_emissions` ADD FOREIGN KEY (`emission_and_consumption_data_id`) REFERENCES `emission_and_consumption_data` (`id`);
