class TrickModel{

  late String question,answer,sign,exponentialAns,dummyAnswer;
    // late String firstDigit,secondDigit;

   List<String> getOptionList() {
    return optionList;
  }

   void setOptionList(List<String> optionList) {
    this.optionList = optionList;
  }

  late List<String> optionList;


   int getFormula_id() {
    return formula_id;
  }

   void setFormula_id(int formula_id) {
    this.formula_id = formula_id;
  }

late   int formula_id;
}