import msvcrt
import math
#import sys


file = "C:\Users\Phillip\College\EECS442\Project\\" + "music.ly"
fptr = open(file, "w")

fptr.write(ur'\version "2.16.0"' + "\n")
fptr.write(ur'\header {' + '\n  title = ' + '"' + "Phil's Majestic Beauty" + '"' + "\n")
fptr.write("  subtitle = Ballsarewack \n}\n")




fptr.write("\n \n" + ur"\relative c' {" + "\n  ")





count=0
lastPressed='\0'
lastPressedCount=0

print("cool")

def writeNote(key) :

	global lastPressed
	global lastPressedCount

	print("sweet")

	#noteDuration = 4/(math.pow(2,lastPressedCount))
	if lastPressedCount == 1:
		noteDuration = '2'
 	elif lastPressedCount == 3:
 		noteDuration = '1'
 	else:
 		noteDuration = '4'

	if key == 'w':
		fptr.write('c' + noteDuration + ' ')
	elif key == 'e':
		fptr.write('d' + noteDuration + ' ')
	elif key == 'r':
		fptr.write('e' + noteDuration + ' ')
	elif key == 't':
		fptr.write('f' + noteDuration + ' ')
	elif key == 'y':
		fptr.write('g' + noteDuration + ' ')
	elif key == 'u':
		fptr.write('a' + noteDuration + ' ')
	elif key == 'i':
		fptr.write('b' + noteDuration + ' ')
	elif key == 'o':
		fptr.write('c' + noteDuration + ' ')

  	#assuming sharps for now lol
	elif key == '3':
		fptr.write('cis' + noteDuration + ' ')
	elif key == '4':
		fptr.write('dis' + noteDuration + ' ')
	elif key == '6':
		fptr.write('fis' + noteDuration + ' ')
	elif key == '7':
		fptr.write('gis' + noteDuration + ' ')
	elif key == '8':
		fptr.write('ais' + noteDuration + ' ')


	#rests
	elif key == 'z':
		fptr.write('r' + noteDuration + ' ')

	return


while 1:
	if msvcrt.kbhit():
		key = msvcrt.getch()
	    #fptr.write(key)
				

		if key == lastPressed:			
			lastPressedCount = lastPressedCount + 1
			lastPressed = key
			continue
		else:						#different keys 
			writeNote(lastPressed)
			lastPressedCount = 0
			lastPressed = key
		
		if key == 'q': 
		    fptr.write(ur'\bar "|."' + '\n}')
		    print("bye bye")
		    #sys.exit()h
		    break



		#if count % 4 == 0:
		#	fptr.write('\n  ')
	

#subprocess.call(['C:\Users\Phillip\College\EECS442\Project\music.ly'])
#time.sleep(10)
#subprocess.call(['C:\Users\Phillip\College\EECS442\Project\music.pdf'])

#sys.exit()


