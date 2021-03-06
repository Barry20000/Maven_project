/*
 * Copyright (C) 2022 Baidu, Inc. All Rights Reserved.
 */
package lol.vo;

import lombok.Data;

@Data
public abstract class BaseResultModel {
  protected Integer code;

  protected String message = "";
}
