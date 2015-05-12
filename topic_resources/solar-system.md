# Let's make a planetary system!

## Breakfast
- Create a `Planet` class with a name attribute
- Create a `SolarSystem` class that has an attribute `planets` that has zero to many `Planet` instances.
- Get creative! Give each instance of `Planet` diameters, mass, moons.. whatever! __Allow these attributes to be set using a hash in initialize.__

## Lunch
- Give your solar system a formation year (in earth years).
- Give each planet a rate of solar rotation
- Define a method that returns the local year of the planet based on it's rotation since the beginning of the solar system

## Dinner
- Write a program that asks for user input to query the planets:
  - First, ask the user to select a planet they'd like to learn about.
  - Present the user with a list of planets from which they can choose. Something like:
    - `1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit`
  - Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
  - Then ask the user for another planet.

## Dessert
- Give each planet a `@distance_from_the_sun` attribute, and a method to determine the distance from any other planet (assuming planets are in a stright line from the sun)

### [Rubric](../rubrics/week_2_solar_system.md)
