within ChaoticCircuits.ColpittsCircuit;
model AnalyticEquations "Colpitts chaotic Circuit"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter SI.Inductance L=98.5e-6 "Inductor";
  parameter SI.Resistance RL=35. "Resistance of L";
  parameter SI.Resistance RE=5000 "Emittor resistor";
  parameter SI.Capacitance C1=54.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=54.e-9 "Capacitor 2";
  //transistor parameters
  parameter Real beta=200 "Transistor forward current gain";
  parameter SI.Voltage Vth=0.75 "Transistor base-emitter threshold voltage";
  parameter SI.Resistance Ron=100 "Small-signal on-resistance of base-emitter junction";
  parameter SI.Voltage Vs=5 "Supply Voltage";
  //shortcut to results
  parameter SI.Frequency f0=1/(2*pi*sqrt(L*C1*C2/(C1+C2))) "Estimated resonance frequency";
  SI.Voltage v1(start=0, fixed=true) "Result 1 c1.v";
  SI.Voltage v2(start=0, fixed=true) "Result 2 c2.v";
  SI.Voltage vRL(start=0, fixed=true)=RL*iL "Voltage of inductor's resistance";
  SI.Current iL "Current through L";
  //auxilliary variables
  SI.Current iB "Base current";
equation
  C1*der(v1)=iL - beta*iB;
  C2*der(v2)=(Vs - v2)/RE - iL - iB;
  L *der(iL)= Vs - v1 + v2 - RL*iL;
  iB = if v2<=Vth then 0 else (v2 - Vth)/Ron;
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ColpittsCircuit\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.01,
      Interval=1e-07,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="RE = 5000 Ohm periodic
RE =   500 Ohm chaotic")}));
end AnalyticEquations;
