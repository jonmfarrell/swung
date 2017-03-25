#!/usr/bin/ruby

require "dbi"

class matchMe

	# the users being checked for matchability
	# TODO: actually fetch them right because this is probably not gonna work
	@@userOne = @users.each do |user|
	@@userTwo = @user.each do |user|

	# these variables are available throughout the class to track "matchability"
	@@matchPoints = 0 # if a user get 6(?) match points, they are a good match and goodMatch is changed to true
	@@possibleMatch = false # are the users possible matches
	@@goodMatch = false # is the user a good match for the other user?
	@@GEO_IDEAL = 15 # this is the highest ideal distance (miles) between users to be from a possible match
	@@GEO_BOUND = 50 # this is the highest allowable distance (miles) between users to be from a possible match
	@@ageHiIdeal = userOne.age + 1 # this is the highest ideal age for a user to go on a date with
	@@ageLoIdeal = userOne.age - 1  # this is the lowest ideal age for a user to go a date with
	@@ageHiBound = userOne.age + 5 # this is the highest allowable age for a user to go on a date with
	@@ageLoBound = userOne.age - 5  # this is the lowest allowable age for a user to go a date with
	@@MAX_MATCH_POINTS = 3 # the number of points you need to be a "good match"
	def matchFound(points)
		if matchPoints >= MAX_MATCH_POINTS
			goodMatch = true
		else
			goodMatch = false
		end
			return goodMatch
	end

	# ESSENTIALS: these must match for people to be consider a match at all
	def checkGenderPref(uOne, uTwo) # checks gender preference
		if uOne.gender_id == uTwo.gender_preference_id
			return true
		else
			return false
		end
	end

	def checkMaxAge(uOne, uTwo) # checks age range is close enough
		if ageLoBound <= uTwo.age <= ageHiBound
			return true
		else
			return false
		end
	end

	def checkMaxDistance(uOne, uTwo) # checks the distance between users to see if they are geographically viable
		# if uOne.distance_to(uTwo.location) <= GEO_BOUND
		# 	return true
		# else
		# 	return false
		# end
	end

	def isPossible(uOne, uTwo) # is a match possible?
		if((checkGenderPref and checkMaxAge and checkMaxDistance) == true)
			possibleMatch = true
		else
			possibleMatch = false
		end
	end


	# IDEAL: are you an ideal match?
	# Weights several values against each other to determine if you are a good match
	# Weights: 
	# Age: 1 point
	# Geographic location:
		# 2 points if you are in the ideal range ( <= 15 miles)
		# 1 point if you are between the ideal range and the bound (15 to 50 miles, exclusively)
	# Favorite team: 3 points 

	def checkIdealAge(uOne, uTwo) # checks to see if users in the ideal range for age
		if (ageLoIdeal <= uTwo.age <= ageHiIdeal)
			return matchPoints = matchPoints + 1
		end
	end

	def checkFavoriteTeam(uOne, uTwo) # checks to see if users have the same favorite team 
		if uOne.favorite_team_id == uTwo.favorite_team_id
			return matchPoints = matchPoints + 3
		end
	end

	def checkLeastFavoriteTeam(uOne, uTwo) # checks to see if users dislike each others favorite team, or if users dislike the same team
		if uOne.favorite_team_id == uTwo.least_favorite_team_id or uOne.least_favorite_team_id == uTwo.favorite_team_id
			return matchPoints = matchPoints - 3
		end 
		if uOne.least_favorite_team_id == uTwo.least_favorite_team_id # "The enemy of my enemy is my future spouse"
			return matchPoints = matchPoints + 2
		end
	end

	def checkIdealDistance(uOne, uTwo) # checks the distance between users to find if they are geographically ideal
		# if uOne.distance_to(uTwo.location) <= GEO_IDEAL
		# 	return matchPoints = matchPoints + 2
		# if GEO_IDEAL < uOne.distance_to(uTwo.location) < GEO_BOUND
		# 	return matchPoints = matchPoints + 1
	end

	def findMatch(uOne, uTwo) # checks if users are a good match
		if isPossible(userOne, uTwo) == true
			matchPoints = checkIdealAge(uOne, uTwo)
			matchPoints = checkFavoriteTeam(uOne, uTwo)
			matchPoints = checkLeastFavoriteTeam(uOne, uTwo)
			matchPoints = checkIdealDistance(uOne, uTwo)
			return matchFound(matchPoints)
		end
	end

	
	# run it!  This is the main of the program
	if findMatch(userOne, userTwo) == true
		print "match found!"
	else
		print "no match found"
	end
end
