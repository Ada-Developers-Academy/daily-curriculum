## Sequence Diagrams

### Scenario 1: Poker Use Case
The scenario begins when the player chooses to start a new round in the UI. The UI asks whether any new players want to
join the round; if so, the new players are added using the UI.

All players' hands are emptied into the deck, which is then shuffled. The player left of the dealer supplies an ante bet of the
proper amount. Next each player is dealt a hand of two cards from the deck in a round-robin fashion; one card to each player,
then the second card.

If the player left of the dealer doesn't have enough money to ante, he/she is removed from the game, and the next player
supplies the ante. If that player also cannot afford the ante, this cycle continues until such a player is found or all players are removed.

### Scenario 2: Add calendar appointment
The scenario begins when the user chooses to add a new appointment in the UI. The UI notices which part of the calendar is active and pops up an Add Appointment window for that date and time.

The user enters information about the appointment's name, location, start and end times. The UI will prevent the user from entering an appointment that has invalid information, such as an empty name or negative duration.

The calendar records the new appointment in the user's list of appointments. Any reminder selected by the user is added to the list of reminders.

If the user already has an appointment at that time, the user is shown a message and asked to choose an available time or replace the appointment. If the user enters an appointment with the same name and duration as an existing meeting, the calendar asks the user whether he/she intended to join that meeting instead. If so, the user is added to that meeting's list of participants.
