class CfnLint < Formula
  include Language::Python::Virtualenv

  desc "Validate CloudFormation templates against the CloudFormation spec"
  homepage "https://github.com/aws-cloudformation/cfn-lint/"
  url "https://files.pythonhosted.org/packages/ab/e2/acdd3ac92785cda95ed2f67721abdce4da876ca1f67db5efbbf9bc928fed/cfn_lint-1.9.6.tar.gz"
  sha256 "c2ebd44ce3a412144f7d147f9fd5e3c6a9daec8db61f8cdc1670d05d38c4708a"
  license "MIT-0"

  livecheck do
    url :stable
    regex(/href=.*?cfn_lint[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 cellar: :any,                 arm64_sonoma:   "eb538f0b1d0105ded40c56622665fc493098eb92b8ee8d8b0c6ffe2007c501a2"
    sha256 cellar: :any,                 arm64_ventura:  "93c9dc09a8cb6dd566d5cf65acd98155158825c358453096bfe0dd3ada6ddf85"
    sha256 cellar: :any,                 arm64_monterey: "6c0388c9cd7997e933efa433fc27618bad27508ed3a08426a94e0339952f479e"
    sha256 cellar: :any,                 sonoma:         "2295690ed4608af000f71f8c397937edb42532de8a8c84ec69ef16463f9a52da"
    sha256 cellar: :any,                 ventura:        "8890073e345e9563ca95d7a972625937ed72d4d0f952695f4dde83619bdedb67"
    sha256 cellar: :any,                 monterey:       "bd7c1686678a6074650e7f776b54d82134d34d2d32b70ae08d7943be61a68094"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b06f4fd0481dee0b6f62fe3a86dea1327bbf875be9f89de89527edf1a372aa2b"
  end

  depends_on "rust" => :build
  depends_on "libyaml"
  depends_on "python@3.12"

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb/attrs-24.2.0.tar.gz"
    sha256 "5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346"
  end

  resource "aws-sam-translator" do
    url "https://files.pythonhosted.org/packages/03/81/448cc26a70366e681eeb4ae868e1e5519f5d2d3d8602dd69731f236cbd43/aws_sam_translator-1.89.0.tar.gz"
    sha256 "fff1005d0b1f3cb511d0ac7e85f54af06afc9d9e433df013a2338d7a0168d174"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/54/4d/ab9ef9ebda797bf162cc489756682044e293a23153eb2339aa7c7faf0ae5/boto3-1.34.157.tar.gz"
    sha256 "7ef19ed38cba9863b58430fb4a66a72a5c250304f234bd1c16b860f9bf25677b"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/ae/d9/e04875f81b82d20ccfaa9fe7db4f794187561eb5c1c4946e999ba1590dd2/botocore-1.34.157.tar.gz"
    sha256 "5628a36cec123cdc8c1158d05a7b06aa5e53649ad73796c50ef3fb51199785fb"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6/jmespath-1.0.1.tar.gz"
    sha256 "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
  end

  resource "jsonpatch" do
    url "https://files.pythonhosted.org/packages/42/78/18813351fe5d63acad16aec57f94ec2b70a09e53ca98145589e185423873/jsonpatch-1.33.tar.gz"
    sha256 "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
  end

  resource "jsonpointer" do
    url "https://files.pythonhosted.org/packages/6a/0a/eebeb1fa92507ea94016a2a790b93c2ae41a7e18778f85471dc54475ed25/jsonpointer-3.0.0.tar.gz"
    sha256 "2b2d729f2091522d61c3b31f82e11870f60b68f43fbc705cb76bf4b832af59ef"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec/jsonschema-4.23.0.tar.gz"
    sha256 "d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/f8/b9/cc0cc592e7c195fb8a650c1d5990b10175cf13b4c97465c72ec841de9e4b/jsonschema_specifications-2023.12.1.tar.gz"
    sha256 "48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc"
  end

  resource "mpmath" do
    url "https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57/mpmath-1.3.0.tar.gz"
    sha256 "7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/04/e6/b164f94c869d6b2c605b5128b7b0cfe912795a87fc90e78533920001f3ec/networkx-3.3.tar.gz"
    sha256 "0c127d8b2f4865f59ae9cb8aafcd60b5c70f3241ebd66f7defad7c4ab90126c9"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e/pydantic-2.8.2.tar.gz"
    sha256 "6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/12/e3/0d5ad91211dba310f7ded335f4dad871172b9cc9ce204f5a56d76ccd6247/pydantic_core-2.20.1.tar.gz"
    sha256 "26ca695eeee5f9f1aeeb211ffc12f10bcb6f71e2989988fda61dabd65db878d4"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/99/5b/73ca1f8e72fff6fa52119dbd185f73a907b1989428917b24cff660129b6d/referencing-0.35.1.tar.gz"
    sha256 "25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/3f/51/64256d0dc72816a4fe3779449627c69ec8fee5a5625fd60ba048f53b3478/regex-2024.7.24.tar.gz"
    sha256 "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/55/64/b693f262791b818880d17268f3f8181ef799b0d187f6f731b1772e05a29a/rpds_py-0.20.0.tar.gz"
    sha256 "d72a210824facfdaf8768cf2d7ca25a042c30320b3020de2fa04640920d4e121"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/cb/67/94c6730ee4c34505b14d94040e2f31edf144c230b6b49e971b4f25ff8fab/s3transfer-0.10.2.tar.gz"
    sha256 "0711534e9356d3cc692fdde846b4a1e4b0cb6519971860796e6bc4c7aea00ef6"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "sympy" do
    url "https://files.pythonhosted.org/packages/ca/99/5a5b6f19ff9f083671ddf7b9632028436167cd3d33e11015754e41b249a4/sympy-1.13.1.tar.gz"
    sha256 "9cebf7e04ff162015ce31c9c6c9144daa34a93bd082f54fd8f12deca4f47515f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6/urllib3-2.2.2.tar.gz"
    sha256 "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"test.yml").write <<~EOS
      ---
      AWSTemplateFormatVersion: '2010-09-09'
      Resources:
        # Helps tests map resource types
        IamPipeline:
          Type: "AWS::CloudFormation::Stack"
          Properties:
            TemplateURL: !Sub 'https://s3.${AWS::Region}.amazonaws.com/bucket-dne-${AWS::Region}/${AWS::AccountId}/pipeline.yaml'
            Parameters:
              DeploymentName: iam-pipeline
              Deploy: 'auto'
    EOS
    system bin/"cfn-lint", "test.yml"
  end
end
