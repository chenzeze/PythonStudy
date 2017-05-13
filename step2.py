#-*-coding:utf-8-*-
import MySQLdb
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
if __name__ == '__main__':

    # 连接数据库
    conn = MySQLdb.connect(
        host='localhost',
        port=3306,
        user='root',
        passwd='5201314',
        charset = "utf8",
        db='homework',
    )

    # 获取数据库执行游标
    cur = conn.cursor()

    # 将某些数据转换为int类型
    def prc_line(line):
        _result = line.decode("utf-8").strip().split(" ")
        _result[0] = int(_result[0])
        _result[2] = int(_result[2])
        return _result


    with open("/home/chen/Downloads/MySQL上课文件/作业/university/exam.txt", "r") as f:
        datas = [prc_line(line) for line in f.readlines()]

    for d in datas:
        cur.execute("insert into exam(student_ID,exam_name,grade) values(%d,'%s',%d)" % (d[0], d[1], d[2]))


    def prc_line2(line):
            _result = line.decode("utf-8").strip().split(" ")
            _result[0] = int(_result[0])
            _result[3] = int(_result[3])
            return _result


    with open("/home/chen/Downloads/MySQL上课文件/作业/university/student.txt","r") as f:
        datas = [prc_line2(line) for line in f.readlines()]

    for d in datas:
        cur.execute("insert into student(ID,name,sex,age,emotion_state,dept_name) values(%d,'%s','%s',%d,'%s','%s')"%(d[0],d[1],d[2],d[3],d[4],d[5]))


    def prc_line3(line):
        _result = line.decode("utf-8").strip().split(" ")
        _result[2] = int(_result[2])
        return _result


    with open("/home/chen/Downloads/MySQL上课文件/作业/university/department.txt", "r") as f:
        datas = [prc_line3(line) for line in f.readlines()]

    for d in datas:
        cur.execute("insert into department(dept_name,building,budget) values('%s','%s',%d)" % (d[0], d[1], d[2]))

    conn.commit()

    # 关闭游标
    cur.close()

    # 关闭连接
    conn.close()