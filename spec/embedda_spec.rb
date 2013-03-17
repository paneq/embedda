require "spec_helper"
require 'embedda'

describe "Embedda" do
  context "Youtube-link" do
    before(:all) do
      @embed_string = '<iframe width="560" height="315" src="http://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>'
    end

    it "should embed when text have a link" do
      story = "http://www.youtube.com/watch?v=dQw4w9WgXcQ".embedda
      expect(story).to eq(@embed_string)
    end

    it "should embed when also other text is present around link" do
      story = "Hello, my name is Kasper: http://www.youtube.com/watch?v=dQw4w9WgXcQ <br/>And I am embedding links".embedda
      expect(story).to eq("Hello, my name is Kasper: #{@embed_string} <br/>And I am embedding links")
    end

    it "should embed when text include anchor tag to Youtube" do
      story = "<a href=\"http://www.youtube.com/watch?v=dQw4w9WgXcQ\">Look here for HalfLife3!</a>".embedda
      expect(story).to eq(@embed_string)
    end

    it "should embed when also other text is present around anchor tag" do
      story = "Hello, my name is Kasper: <a href=\"http://www.youtube.com/watch?v=dQw4w9WgXcQ\">Look here for HalfLife3!</a> <br/>And I am embedding links".embedda
      expect(story).to eq("Hello, my name is Kasper: #{@embed_string} <br/>And I am embedding links")
    end
  end

  context "Vimeo-link" do
    before(:all) do
      @embed_string = "<iframe src=\"http://player.vimeo.com/video/20241459\" width=\"500\" height=\"281\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>"
    end

    it "should embed when text have a link" do
      story = "http://vimeo.com/20241459".embedda
      expect(story).to eq(@embed_string)
    end

    it "should embed when also other text is present around link" do
      story = "Hello, my name is Kasper: http://vimeo.com/20241459 <br/>And I am embedding links".embedda
      expect(story).to eq("Hello, my name is Kasper: #{@embed_string} <br/>And I am embedding links")
    end

    it "should embed when text include anchor tag to Youtube" do
      story = "<a href=\"http://vimeo.com/20241459\">Look here for HalfLife3!</a>".embedda
      expect(story).to eq(@embed_string)
    end

    it "should embed when also other text is present around anchor tag" do
      story = "Hello, my name is Kasper: <a href=\"http://vimeo.com/20241459\">Look here for HalfLife3!</a> <br/>And I am embedding links".embedda
      expect(story).to eq("Hello, my name is Kasper: #{@embed_string} <br/>And I am embedding links")
    end
  end
end