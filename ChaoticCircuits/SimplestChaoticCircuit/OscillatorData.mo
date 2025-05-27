within ChaoticCircuits.SimplestChaoticCircuit;
record OscillatorData "Parameters of resonance circuit with memristor"
  extends Modelica.Icons.Record;
  parameter SI.Inductance L=3 "Inductance";
  parameter SI.Capacitance C=1 "Capacitance";
  parameter SI.AngularVelocity w0=1/sqrt(L*C) "Natural resonance frequency";
  parameter SI.Impedance Z0=sqrt(L/C) "Characteristic impedance";
  parameter SI.Resistance RS=0 "Sensing resistor";
  parameter SI.Resistance R0=1.55 "Memristor parameter";
  parameter SI.Current I0=0.6 "Memristor parameter";
  annotation(defaultComponentPrefixes="parameter");
end OscillatorData;
