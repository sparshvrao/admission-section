import xlsxwriter  
def allstudentdata(columnlist,datalist):
    workbook = xlsxwriter.Workbook('static/excel/data.xlsx')   
    worksheet = workbook.add_worksheet("My sheet") 
    row = 0
    col = 0

    for i in ['stu_id']+columnlist:
        worksheet.write(row, col, i)
        col+=1
    for a in datalist:
        row+=1
        col=0
        for i in a:
            worksheet.write(row,col,i)
            col+=1
    workbook.close()
