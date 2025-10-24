# Projektarbeit: Motorregelung

## Überblick
Ziel dieser Projektarbeit ist es, eine Regelung für einen BLDC-Motor zu erstellen. Durch den Aufbau soll die grundlegende Funktion der Regelung verdeutlicht werden. Zielgruppe für dieses Projekt sind Personen ohne technisches Vorwissen (Schulklassen).
    
## Ideen zur Umsetzung
Aufbau eines PID-Reglers
- evtl. mögliche Regelgrößen:
    - Drehzahl - optisches Feedback z.B. durch Graph
    - Drehmoment - haptisches Feedback mit Handrad am Motor
    - Position
    - Leistung und Drehzahl wird mit einem Laptop als Graph geplottet
    
- P-, I- & D-Anteil durch Nutzer einstellbar
    - einstellbar mit Drehencoder oder Potentiometer
    - 2 

## Erarbeitetes Konzept 
Modularer Aufbau: Dieser Besteht aus:
- Steuerungsblock, bestehend aus:
    - Nucleo, 
    - Treiberboard und 
    - Display
- Motorblock 1: Getriebemotor mit 1/76 untersetzung 
- Motorblock 2: BLDC-Motor ohne Getriebe
- Motorblock 3: Getriebemotor mit anderer untersetzung 
- Drehmomentmessblock: Digitaler Drehmomentsensor
- Interaktionsblöcke:
    Diese Definieren den Modus (Drehzahl oder Drehmoment) 
    - Eine Scheibe zum Anfassen
    - Eine Miniseilwinde an dessen Seil ein Kraftsensor angebracht werden kann
    - Eine Scheibe mit LEDs -> Optische Illusion bei Drehzahländerung 
Diese können aneinander gesteckt werden und werden vom uC erkannt. 
Ein angeschlossener Laptop Plottet die Drehzahl und aufgenommene Motorleistung in einen Grapen (MatLab oder Python)
Jedes Modul hat einen EEPROM mit einer Initialisierung, um dies zu erkennen

            
## Hardware
- Nucleo-Entwicklungsboard
- BLDC-Motor (Getriebemotor)
- IHM16M1 Motortreiber
    - eigenes Treiberboard entwerfen?
- Gehäuse
    - Drehknöpfe zum Einstellen des Reglers
    - Technik soll sichtbar sein
    - Handrad zum Bremsen oder Drehen des Motors
- externes Netzteil (24V DC Schutzkleinspannung, laienbedienbar)
- LCD-Display für Soll- und Ist-Werte

## Software
- Regelungsentwurf in MatLab
- Programmierung des STM in C
