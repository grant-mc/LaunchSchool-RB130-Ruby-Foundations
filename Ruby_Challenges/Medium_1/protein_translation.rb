class InvalidCodonError < StandardError; end

class Translation
CODONS = {
  'Methionine' => %w(AUG),
  'Phenylalanine' => %w(UUU UUC),
  'Leucine' => %w(UUA UUG),
  'Serine' => %w(UCU UCC UCA UCG),
  'Tyrosine' => %w(UAU UAC),
  'Cysteine' => %w(UGU UGC),
  'Tryptophan' => %w(UGG),
  'STOP' => %w(UAA UAG UGA)
}

  def self.of_codon(codon)
    CODONS.each_pair { |key, val| return key if val.any?(codon) }
  end

  def self.of_rna(strand)
    result =[]
    raise InvalidCodonError if strand.upcase.match(/[^UAGC]/)
    strand.scan(/(...)/) do |codon|
      codon = codon.join('')
      of_codon(codon) == 'STOP' ? break : result << of_codon(codon)
    end
    result
  end

end
