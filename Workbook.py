import xlsxwriter 
workbook = xlsxwriter.Workbook('data.xlsx')   
worksheet = workbook.add_worksheet("My sheet") 

row = 0
col = 0

qn=["Student USN",'Name','Email','Address']

for i in qn:
	worksheet.write(row, col, i)
	col+=1
	
ans=[['01jst17cs001','Nanda','abc@gmail.com','Mysore'],['01jst17cs002','Krishna','dfe@gmail.com','Bangalore']]

for a in ans:
    row+=1
    col=0
    for i in a:
        worksheet.write(row,col,i)
        col+=1
workbook.close()
