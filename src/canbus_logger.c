/**
 * ecutools: IoT Automotive Tuning, Diagnostics & Analytics
 * Copyright (C) 2014  Jeremy Hahn
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

 #include "canbus_logger.h"

unsigned int canbus_logger_run(canbus_logger *logger) {
  syslog(LOG_DEBUG, "canbus_logger_run: running");
  canbus_filelogger_run(logger);
}

unsigned int canbus_logger_stop(canbus_logger *logger) {
  syslog(LOG_DEBUG, "canbus_logger_stop: stopping");
  canbus_filelogger_stop(logger);
}