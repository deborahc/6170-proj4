require 'test_helper'

class PostingTest < ActiveSupport::TestCase
	# Tests the attributes and associations of the review class for correctness
	def test_posting_attributes
		assert_equal(postings(:one).supervisor_id, 4, "Check supervisor id attribute and association")
		assert_equal(postings(:one).title, "Discovering Security Flaws in Web Applications", "Check title attribute")
		assert_equal(postings(:one).skills, "Ruby on Rails, Taken 6.170 preferred", "Check skills attribute")
		assert_equal(postings(:one).funding_type, "Lab Funded", "Check funding type attribute")
		assert_equal(postings(:one).description, "Rubicon is a tool for automatically checking rich properties of Ruby on Rails web applications. The existing tool allows programmers to easily replace the standard concrete test cases currently in widespread use with general specifications of the application's desired behavior. This project's goal is to build a domain-specific tool, based on Rubicon, for discovering and checking security policies of web applications. The tasks involved will include implementing various features of the tool in Ruby, selecting and preparing a set of Rails-based case-study applications, and using the new tool on these applications in order to refine it.", "Check description attribute")

		assert_equal(postings(:two).supervisor_id, 4, "Check supervisor id attribute and association")
		assert_equal(postings(:two).title, "Rethinking Software Design", "Check title attribute")
		assert_equal(postings(:two).skills, "Ruby on Rails, Taken 6.170 preferred", "Check skills attribute")
		assert_equal(postings(:two).funding_type, "Lab Funded", "Check funding type attribute")
		assert_equal(postings(:two).description, "We're developing a new approach to software design that emphasizes the conceptual models that underlie complex systems. As part of this effort, we're engaging in a series of small projects in which we redesign or repackage applications (such as Git) that are widely used but often regarded as unnecessarily complicated and difficult to use.", "Check description attribute")

		assert_equal(postings(:three).supervisor_id, 4, "Check supervisor id attribute and association")
		assert_equal(postings(:three).title, "Cloud-based Analysis of Software Designs", "Check title attribute")
		assert_equal(postings(:three).skills, "Ruby on Rails, Taken 6.170 preferred", "Check skills attribute")
		assert_equal(postings(:three).funding_type, "Lab Funded", "Check funding type attribute")
		assert_equal(postings(:three).description, "Alloy (alloy.mit.edu) is an analyzer for software models that has been widely applied in many areas, from security protocols to web ontologies. It ships with a suite of built in solvers that power its analysis. The aim of this project is to build and experiment with a new option, in which the analyzer would use a server farm of SAT solvers offered by a startup that should make it possible to do faster analyses and handle more complex designs.", "Check description attribute")

		assert_equal(postings(:four).supervisor_id, 7, "Check supervisor id attribute and association")
		assert_equal(postings(:four).title, "PMath: PMath Probabilistic generative models for mathematical expressions that fit the data", "Check title attribute")
		assert_equal(postings(:four).skills, "MATLAB", "Check skills attribute")
		assert_equal(postings(:four).funding_type, "Lab Funded", "Check funding type attribute")
		assert_equal(postings(:four).description, "We are interested in exploring data in new ways. Our immediate question is whether it is possible to generate white-box (i.e. interpretable) non-linear models which could further be mined for more information about the underlying generating process. Our current tact is to model the data via a large set of mathematical expressions which can be evaluated in a straight forward way with respect to their fit to the data. We then form a probability distribution over the better expressions of the set and then generate newer ones by sampling this distribution. Our initial steps raise more questions e.g. how best to model variable length mathematical expressions as a probability density function? How many samples of a pdf are sufficient to reflect its properties? How to learn this distribution from sub-samples that are a better fit? How to efficiently recover mathematical expressions of varying length from a pdf describing a sample", "Check description attribute")

		assert_equal(postings(:five).supervisor_id, 7, "Check supervisor id attribute and association")
		assert_equal(postings(:five).title, "MLWind ML-Wind: Machine learning for Wind Energy", "Check title attribute")
		assert_equal(postings(:five).skills, "Machine Learning experience", "Check skills attribute")
		assert_equal(postings(:five).funding_type, "Lab Funded", "Check funding type attribute")
		assert_equal(postings(:five).description, "We are building a variety of machine learning systems for wind energy systems. Our focus currently is on building a statistical inference system that is able to predict the long term wind energy at a test location. Preliminary analysis has shown that these techniques provide good performance when compared to a variety of techniques used in the wind community. Currently, we are looking to extend this work and collect data sets that are particularly challenging and test our algorithms. Our immediate goal is to provide a web based interface to our algorithms such that their use is available to wind energy projects at community and small wind level. These small scale projects are particularly affected by poor resource assessment since the project budgets are so low that they cannot afford ML algorithm development and statistical analysis. This service would enable them to cheaply assess the wind resource at a site.", "Check description attribute")

		assert_equal(postings(:six).supervisor_id, 7, "Check supervisor id attribute and association")
		assert_equal(postings(:six).title, "Mining data from MIT EdX", "Check title attribute")
		assert_equal(postings(:six).skills, "Machine Learning experience", "Check skills attribute")
		assert_equal(postings(:six).funding_type, "Lab Funded", "Check funding type attribute")
		assert_equal(postings(:six).description, "We are developing different machine learning algorithms for mining data generated while delivering educational content to hundreds and thousands of students all over the world. A very fundamental question that folks in education are attempting to answer is: What worked? Answering this question would require us to analyze data in novel ways, for example building models of students, balancing for confounding factors. We are looking for a talented UROP to work with a Research Scientist and a group of scientists and fellows at the MIT EdX team. This project has possible transformative impact on next generation education systems.", "Check description attribute")
	end
end