        01 EMP-HEADER.                                                  00300035
           05 EMP-NAME    PIC X(10) VALUE  'EMP NAME'.                  00310037
           05 WS-D-1      PIC X(01) VALUE  '|'.                         00320029
           05 DEPART-CD   PIC X(10) VALUE  'DEPARTMENT'.                00330037
           05 WS-D-2      PIC X(01) VALUE  '|'.                         00340035
           05 DESIG       PIC X(11) VALUE  'DESIGNATION'.               00350037
           05 WS-D-5      PIC X(01) VALUE  '|'.                         00360029
      *    05 PSKILL      PIC X(15) VALUE  'PRIMARY SKILL'.             00370040
      *    05 WS-D-6      PIC X(01) VALUE  '|'.                         00380040
      *    05 EXP         PIC X(10) VALUE  'EXPERIENCE'.                00390040
      *    05 WS-D-7      PIC X(01) VALUE  '|'.                         00400040
           05 WS-FILLER   PIC X(52) VALUE SPACES.                       00410040
        01 EMP-DTL.                                                     00420039
           05 D-EMP-NAME    PIC X(10) VALUE  'EMP NAME'.                00430039
           05 WS-D-11     PIC X(01) VALUE  '|'.                         00440039
           05 D-DEPART-CD   PIC X(10) VALUE  'DEPARTMENT'.              00450039
           05 WS-D-22     PIC X(01) VALUE  '|'.                         00460039
           05 D-DESIG       PIC X(11) VALUE  'DESIGNATION'.             00470039
           05 WS-D-52     PIC X(01) VALUE  '|'.                         00480039
      *    05 D-PSKILL      PIC X(15) VALUE  'PRIMARY SKILL'.           00490040
      *    05 WS-D-62     PIC X(01) VALUE  '|'.                         00500040
      *    05 D-EXP         PIC X(10) VALUE  'EXPERIENCE'.              00510040
      *    05 WS-D-72     PIC X(01) VALUE  '|'.                         00520040
           05 WS-FILLER1  PIC X(52) VALUE SPACES.                       00530040
        01 EMP-TRL.                                                     00540022
           05 TOTAL-READ PIC 9(02).                                     00550023
           05 WS-SPACE  PIC X(01) VALUE SPACES.                         00560041
           05 WS-A          PIC X(67).                                  00570022
           05 FILLER        PIC X(097).                                 00580041
      *                                                                 00590000