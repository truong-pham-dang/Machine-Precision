! https://www.cfd-online.com/Wiki/Machine_precision
PROGRAM MAIN 
      IMPLICIT NONE
      DOUBLE PRECISION DEPS, DA
      REAL EPS, A
      INTEGER N, DN
 
      EPS = 1.0
      DEPS = 1.0D0
      N = 0
      DN = 0
 
! determination of epsilon for reals (single precision)
 
1     EPS = EPS / 2.0
      A = EPS + 1.0
!      PRINT *, A
      IF (A .GT. 1.0) THEN
         N = N + 1
         GOTO 1
      ELSE
         EPS = ABS(2.0 * EPS)
      END IF

! determination of epsilon for double precision
 
2     DEPS = DEPS / 2.0D0
      DA = DEPS + 1.0D0
!      PRINT *, DA
      IF (DA .GT. 1.0D0) THEN
         DN = DN + 1
         GOTO 2
      ELSE
         DEPS = DABS(2.0D0 * DEPS)
      END IF
 
      IF(N .eq. DN)THEN
           PRINT*,'Your computer probably has a math coprocessor.'
           PRINT*,'Uncomment the two print statements and rerun.'
           STOP
      ENDIF

      WRITE(*,9) -N
9     FORMAT(40x,i3)
      WRITE(*,10) eps
10    FORMAT(' Single precision =',e16.8,' or 2')
      WRITE(*,9) -DN
      WRITE(*,12) deps
12    FORMAT(' Double precision =',e16.8,' or 2')

      STOP
      END
