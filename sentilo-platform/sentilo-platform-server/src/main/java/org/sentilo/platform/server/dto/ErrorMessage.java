/*
 * Sentilo
 * 
 * Original version 1.4 Copyright (C) 2013 Institut Municipal d’Informàtica, Ajuntament de
 * Barcelona. Modified by Opentrends adding support for multitenant deployments and SaaS.
 * Modifications on version 1.5 Copyright (C) 2015 Opentrends Solucions i Sistemes, S.L.
 *
 * 
 * This program is licensed and may be used, modified and redistributed under the terms of the
 * European Public License (EUPL), either version 1.1 or (at your option) any later version as soon
 * as they are approved by the European Commission.
 * 
 * Alternatively, you may redistribute and/or modify this program under the terms of the GNU Lesser
 * General Public License as published by the Free Software Foundation; either version 3 of the
 * License, or (at your option) any later version.
 * 
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.
 * 
 * See the licenses for the specific language governing permissions, limitations and more details.
 * 
 * You should have received a copy of the EUPL1.1 and the LGPLv3 licenses along with this program;
 * if not, you may find them at:
 * 
 * https://joinup.ec.europa.eu/software/page/eupl/licence-eupl http://www.gnu.org/licenses/ and
 * https://www.gnu.org/licenses/lgpl.txt
 */
package org.sentilo.platform.server.dto;

import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

public class ErrorMessage {

  @JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
  private int code;
  @JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
  private String message;
  @JsonSerialize(include = JsonSerialize.Inclusion.NON_EMPTY)
  private List<String> errorDetails;

  public ErrorMessage() {
    super();
  }

  public ErrorMessage(final int code, final String message) {
    this();
    this.code = code;
    this.message = message;
  }

  public ErrorMessage(final int code, final String message, final List<String> errorDetails) {
    this(code, message);
    this.errorDetails = errorDetails;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(final String message) {
    this.message = message;
  }

  public int getCode() {
    return code;
  }

  public void setCode(final int code) {
    this.code = code;
  }

  public void setErrorDetails(final List<String> errorDetails) {
    this.errorDetails = errorDetails;
  }

  public List<String> getErrorDetails() {
    return errorDetails;
  }

}
