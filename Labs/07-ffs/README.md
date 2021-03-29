D:  q(n+1)=d;
JK: q(n+1)=j*/qn + /k* qn;
T:  q(n+1)=t*/qn + /t* qn;

   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 | 0 |  |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 | 0 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 0 | 1 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 1 | 1 |  |

   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 | 0 | 0 | No change |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 | 1 | 1 | No change |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 | 0 | 0 |  |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 | 1 | 0 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 0 | 0 | 1 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 0 | 1 | 1 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 1 | 0 | 1 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 1 | 1 | 0 |  |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 | 0 |  |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 | 1 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 0 | 1 |  |
   | ![rising](Images/eq_uparrow.png) | 1 | 1 | 0 |  |




