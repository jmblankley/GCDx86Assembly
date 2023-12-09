TARGET = gcd
OBJS = main.o convertFirstNumber.o convertSecondNumber.o findGCD.o printAX.o printDigit.o printAnswerStatement.o printAnd.o printIs.o printSpace.o printNL.o printPeriod.o

$(TARGET): $(OBJS)
	ld -o $@ $(OBJS)

%.o: %.s
	nasm -felf64 -F STABS $<

clean:
	rm -f $(TARGET) $(OBJS)
