CREATE TABLE IF NOT EXISTS `sessions` (
    `session_id` varchar(128) NOT NULL,
    `expires` int(11) unsigned NOT NULL,
    `data` text,
    PRIMARY KEY (`session_id`)
  ) DEFAULT CHARSET=utf8;

  CREATE TABLE IF NOT EXISTS `users` (
      `id` int(5) NOT NULL AUTO_INCREMENT,
      `email_id` varchar(225) NOT NULL,
      `username` varchar(30) NOT NULL,
      `password` varchar(33) NOT NULL,
      `is_active` BOOLEAN DEFAULT 1,
      `is_admin` BOOLEAN DEFAULT 0,
      `bucket_id` int(11) DEFAULT 0 NOT NULL,
      PRIMARY KEY (`id`),
      CONSTRAINT UNIQUE_USER_EMAIL UNIQUE(email_id)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4;

  CREATE TABLE  IF NOT EXISTS `buckets` (
      `bucket_id` int(11) NOT NULL,
      `value` text NOT NULL,
      PRIMARY KEY (`bucket_id`)
    ) DEFAULT CHARSET=utf8;

  CREATE TABLE IF NOT EXISTS `records` (
    `id` varchar(13) PRIMARY KEY,
    `name` varchar(30),
    `creator` int(5),
    `publish_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `link` text NOT NULL,
    CONSTRAINT fk_user
      FOREIGN KEY (creator)
          REFERENCES users(id)
          ON DELETE SET NULL
          ON UPDATE CASCADE
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1;
