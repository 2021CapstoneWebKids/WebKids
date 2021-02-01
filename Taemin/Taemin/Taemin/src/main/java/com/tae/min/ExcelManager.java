package com.tae.min;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Cell;

public class ExcelManager {

	private Workbook targetFile;

	public Workbook getTargetFile() {
		return targetFile;
	}

	public void setTargetFile(Workbook targetFile) {
		this.targetFile = targetFile;
	}
	
	public List<Map> readExcel(FileInputStream fis) throws Exception {
		targetFile = new XSSFWorkbook(fis);
		Sheet sheet = targetFile.getSheetAt(0);
		List<Map> result = new ArrayList<Map>();
		int rowIdx = sheet.getPhysicalNumberOfRows();
		
		for(int ridx = 0; ridx < rowIdx; ridx++) {
			Row row = sheet.getRow(ridx);
			Map rowData = new HashMap();
			if(row != null) {
				int cellIdx = row.getPhysicalNumberOfCells();
				
				for(int cidx = 0; cidx <= cellIdx; cidx++) {
					Cell cell = row.getCell(cidx);
					String data = "";
					if(cell == null) {
						continue;
					} else {
						switch(cell.getCellType()) {
						case STRING:
							data = cell.getStringCellValue();
							break;
						case _NONE:
							break;
						case BLANK:
							break;
						case BOOLEAN:
							System.out.println(cell.getBooleanCellValue());
							data = String.format("%s", cell.getBooleanCellValue());
							break;
						case ERROR:
							break;
						case FORMULA:
							break;
						case NUMERIC:
							System.out.println(cell.getNumericCellValue());
							data = String.format("%f", cell.getNumericCellValue());
							break;
						}

						rowData.put("cidx" + cidx, data);
					}
				}
			}
			result.add(rowData);
		}
		
		return result;
	}
}
