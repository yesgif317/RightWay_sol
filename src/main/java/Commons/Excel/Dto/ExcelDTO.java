package Commons.Excel.Dto;

import lombok.Data;

@Data
public class ExcelDTO {
    private StatusEnum resultCode;
    private String message;

    public ExcelDTO() {
        this.resultCode = StatusEnum.BAD_REQUEST;
        this.message = null;
    }

    @Override
    public String toString() {
        return resultCode+","+message;
    }

}
