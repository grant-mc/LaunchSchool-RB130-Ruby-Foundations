class DNA
  def initialize(strand)
    @orig_strand = strand
  end

  def hamming_distance(other_strand)
    comp_strand =""
    comp_strand2 = ""
    distance = 0
    if @orig_strand.length > other_strand.length
      comp_strand,comp_strand2 = other_strand, @orig_strand
    else
      comp_strand,comp_strand2 = @orig_strand, other_strand
    end
    comp_strand.split('').each_with_index do |char, idx|
      #p comp_strand[idx] + " = " + comp_strand2[idx]
      distance += 1 if comp_strand[idx] != comp_strand2[idx]
    end
    distance

  end

end