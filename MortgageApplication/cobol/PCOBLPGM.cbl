        IDENTIFICATION DIVISION.                                        00010000
        PROGRAM-ID.    PCOBLPGM.                                        00020005
        ENVIRONMENT DIVISION.                                           00030000
        INPUT-OUTPUT SECTION.                                           00040002
        FILE-CONTROL.                                                   00050002
           SELECT EMP-FILE ASSIGN TO IFILE                              00060034
           ORGANIZATION IS  SEQUENTIAL.                                 00070034
           SELECT EMP-REPT ASSIGN TO SOUT                               00080034
           ORGANIZATION IS  SEQUENTIAL.                                 00090034
        DATA DIVISION.                                                  00100000
        FILE SECTION.                                                   00110002
      *                                                                 00120002
        FD EMP-FILE                                                     00130034
             RECORD CONTAINS 80   CHARACTERS                            00140034
             DATA RECORD IS EMP-REC.                                    00150034
                                                                        00160034
        01 EMP-REC        PIC X(80).                                    00170034
      *                                                                 00180002
        FD EMP-REPT                                                     00190034
             RECORD CONTAINS 80   CHARACTERS                            00200034
             DATA RECORD IS EMP-REPT-REC.                               00210034
                                                                        00220034
        01 EMP-REPT-REC   PIC X(80).                                    00230034
                                                                        00240034
        WORKING-STORAGE SECTION.                                        00250000
                                                                        00260003
        01  EMP-FILE-EOD  PIC X(02) VALUE  SPACES.                      00270006
        01  EMP-RECS-CNT  PIC 9(02).
      *  COPY RECSTRUC.                                                 00280003
      *                                                                 00290000
        01 EMP-HEADER.                                                  00300035
           05 EMP-NAME    PIC X(10) VALUE  'EMP NAME'.                  00310037
           05 WS-D-1      PIC X(01) VALUE  '|'.                         00320029
            05 DEPART-CD   PIC X(10) VALUE  'DEPARTMENT'.               00330037
            05 WS-D-2      PIC X(01) VALUE  '|'.                        00340035
            05 DESIG       PIC X(11) VALUE  'DESIGNATION'.              00350037
            05 WS-D-5      PIC X(01) VALUE  '|'.                        00360029
           05 PSKILL      PIC X(15) VALUE  'PRIMARY SKILL'.             00370040
           05 WS-D-6      PIC X(01) VALUE  '|'.                         00380040
           05 EXP         PIC X(10) VALUE  'EXPERIENCE'.                00390040
           05 WS-D-7      PIC X(01) VALUE  '|'.                         00400040
            05 WS-FILLER   PIC X(52) VALUE SPACES.                      00410040
         01 EMP-DTL.                                                    00420039
            05 D-EMP-NAME    PIC X(10) VALUE  'EMP NAME'.               00430039
            05 WS-D-11     PIC X(01) VALUE  '|'.                        00440039
            05 D-DEPART-CD   PIC X(10) VALUE  'DEPARTMENT'.             00450039
            05 WS-D-22     PIC X(01) VALUE  '|'.                        00460039
            05 D-DESIG       PIC X(11) VALUE  'DESIGNATION'.            00470039
            05 WS-D-52     PIC X(01) VALUE  '|'.                        00480039
            05 D-PSKILL      PIC X(15) VALUE  'PRIMARY SKILL'.          00490040
            05 WS-D-62     PIC X(01) VALUE  '|'.                        00500040
            05 D-EXP         PIC X(10) VALUE  'EXPERIENCE'.             00510040
           05 WS-D-72     PIC X(01) VALUE  '|'.                         00520040
            05 WS-FILLER1  PIC X(52) VALUE SPACES.                      00530040
         01 EMP-TRL.                                                    00540022
            05 TOTAL-READ PIC 9(02).                                    00550023
            05 WS-SPACE  PIC X(01) VALUE SPACES.                        00560041
            05 WS-A          PIC X(67).                                 00570022
            05 FILLER        PIC X(097).                                00580041
      *                                                                 00590000
      ******************************************************************00600000
      *                                                                 00610002
      *                                                                 00620002
      *                                                                 00630002
      ******************************************************************00640000
        PROCEDURE DIVISION.                                             00650000
        MAIN-PARA.                                                      00660003
      *    INITIALIZE EMP-REPT-REC.                                     00670033
      *                                                                 00680021

           DISPLAY 'Today is MAY102019 THURSD Demo run-01'              00690028
           OPEN INPUT EMP-FILE                                          00700034
                OUTPUT EMP-REPT.                                        00710034
           MOVE ZEROES TO EMP-RECS-CNT.                                 00720034
                                                                        00730025
                                                                        00740025
           MOVE EMP-HEADER  TO  EMP-REPT-REC.                           00750035
           WRITE EMP-REPT-REC.                                          00760035
      *    DISPLAY 'EMP-REPT-REC' EMP-REPT-REC

                                                                        00770033
           READ EMP-FILE                                                00780039
            AT END MOVE 'NO' TO EMP-FILE-EOD                            00790039
           END-READ.                                                    00800039
           PERFORM PROCESS-RECORDS                                      00810039
             UNTIL EMP-FILE-EOD = 'NO' .                                00820039
           PERFORM PRINT-EMP-REPORT.                                    00830039
           CLOSE EMP-FILE                                               00840039
                 EMP-REPT.                                              00850039
           STOP RUN.                                                    00860003
       PROCESS-RECORDS.                                                 00870039
                                                                        00880039


                                                                        00890039
           MOVE EMP-REC      TO  EMP-DTL .                              00900039
                                                                        00910039
           MOVE EMP-DTL(1:34) TO  EMP-REPT-REC.                         00920040
           WRITE EMP-REPT-REC.                                          00930039
                                                                        00940039
           INITIALIZE EMP-REPT-REC                                      00950039
           ADD 1 TO EMP-RECS-CNT.                                       00960039
           READ EMP-FILE                                                00970039
            AT END MOVE 'NO' TO EMP-FILE-EOD                            00980039
           END-READ.                                                    00990039
       PRINT-EMP-REPORT.                                                01000039
           INITIALIZE EMP-REPT-REC                                      01010039
                      EMP-TRL.                                          01020041
           MOVE EMP-RECS-CNT TO TOTAL-READ.                             01030039
           MOVE 'RECORDS WERE READ' TO WS-A.                            01040039
           MOVE EMP-TRL      TO EMP-REPT-REC.                           01050039
           WRITE EMP-REPT-REC.                                          01060039
