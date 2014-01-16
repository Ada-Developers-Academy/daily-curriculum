class BlogPost
  attr_accessor :comments
  attr_reader :title, :body, :published_at
  def initialize(attrs={})
    @title    = attrs[:title]
    @body     = attrs[:body]
    @comments = []
  end
  
  def published?
    !@published_at.nil?
  end
  
  def publish!
    @published_at = Time.now
    return true
  end
  
end

body = "Apollonius of Perga as a patch of light galaxies not a sunrise but a galaxyrise tendrils of gossamer clouds. Vanquish the impossible, Orion's sword concept of the number one dream of the mind's eye Jean-François Champollion ship of the imagination tendrils of gossamer clouds not a sunrise but a galaxyrise bits of moving fluff! Venture hundreds of thousands another world culture. Rings of Uranus ship of the imagination paroxysm of global death trillion, another world, culture trillion brain is the seed of intelligence quasar extraplanetary circumnavigated Apollonius of Perga cosmos.
Hypatia preserve and cherish that pale blue dot trillion, with pretty stories for which there's little good evidence rich in mystery tesseract take root and flourish citizens of distant epochs, a billion trillion Sea of Tranquility, quasar. Cosmos muse about. Dream of the mind's eye muse about paroxysm of global death a mote of dust suspended in a sunbeam are creatures of the cosmos made in the interiors of collapsing stars, muse about prime number. Of brilliant syntheses. Tesseract, cosmos a mote of dust suspended in a sunbeam Orion's sword! Vangelis, inconspicuous motes of rock and gas bits of moving fluff, not a sunrise but a galaxyrise? Science!
Great turbulent clouds! Rings of Uranus. Are creatures of the cosmos take root and flourish venture the sky calls to us? Science! Descended from astronomers vastness is bearable only through love? A still more glorious dawn awaits the only home we've ever known. Hundreds of thousands muse about? Globular star cluster venture? Drake Equation galaxies cosmic fugue, Euclid light years vastness is bearable only through love! At the edge of forever Drake Equation a billion trillion, astonishment not a sunrise but a galaxyrise across the centuries emerged into consciousness billions upon billions galaxies. Cambrian explosion.
Tunguska event circumnavigated intelligent beings a mote of dust suspended in a sunbeam consciousness as a patch of light extraplanetary trillion citizens of distant epochs quasar how far away cosmic fugue! Corpus callosum Rig Veda something incredible is waiting to be known, billions upon billions, radio telescope star stuff harvesting star light hearts of the stars rings of Uranus the carbon in our apple pies, billions upon billions descended from astronomers prime number. Rich in mystery Euclid, dispassionate extraterrestrial observer, explorations corpus callosum and billions upon billions upon billions upon billions upon billions upon billions upon billions."

post = BlogPost.new(body: body, title: "The Cosmos Awaits")

post.publish!

if post.published?
  
  seconds = post.published_at.to_i
  
  post.comments << "I published a blog post #{seconds} seconds after 1970."
end

post.comments.first.length