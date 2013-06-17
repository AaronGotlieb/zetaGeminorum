pro period
vmag = dblarr(6)
vmag[0] = 4.03
vmag[1] = 3.82
vmag[2] = 3.96
vmag[3] = 4.09
vmag[4] = 4.13
vmag[5] = 3.84
day = [0,15,21,28,29,43]
;above creates array for days and magnintudes as calculated by ds9
daytmp = findgen(6)
period = 10 ;variable to be modified in order to best estimate the period of the start
;note, the current value ten is the most accurate period we came up with

for i = 0, 5 do begin ;first for loop to iterate five times for each magnintude value
  daytmp[i] = day[i]
  while daytmp[i] gt period do begin ; second loop that runs as long as the day > the period
    daytmp[i] = daytmp[i] - period ; subtracts off period so that each value will have the same period day
    endwhile
  endfor

print, daytmp
print, day
plot, daytmp,vmag, psym = 2, xrange = [-1,period], yrange = [3.8,4.2];, ystyle = 1
end
