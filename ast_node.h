#include <cstdio>
#include <string>

enum Oper {PlusOp, MinusOp, TimesOp, DivideOp};
struct Symbol;
struct Exp;

struct ASTNode {
  int pos_;
  virtual ~ASTNode() {}
  virtual void print() {}
};

struct Var : public ASTNode {};
struct SimpleVar : public Var {
  Symbol *sym_;
  SimpleVar(Symbol *s) : sym_(s) {}
};
struct FieldVar : public Var {
  Symbol *sym_;
  Var *var_;
};
struct SubVar: public Var {
  Var *var_;
  Exp *exp;
};

struct Exp : public ASTNode {
  virtual int eval() {}
};
struct VarExp : public Exp {
  Var *var_;
  VarExp(Var *v) : var_(v) {}
};
struct NilExp : public Exp {};
struct IntExp : public Exp {
  int int_;
  IntExp(int i) : int_(i) {}
  virtual int eval() {
    return int_;
  }
};
struct StringExp : public Exp {
  std::string string_;
  StringExp(std::string s) : string_(s) {}
};
struct OpExp : public Exp {
  Oper op_;
  Exp *left_, *right_;
  OpExp(Oper o, Exp *l, Exp *r) :
    op_(o), left_(l), right_(r) {}
  virtual void print() {
    
  }
  virtual int eval() {
    int lv = left_->eval(), rv = right_->eval();
    switch (op_) {
    case PlusOp:
      return lv + rv;
    case MinusOp:
      return lv - rv;
    case TimesOp:
      return lv * rv;
    case DivideOp:
      return lv / rv;
    }
  }
};
struct AssignExp : public Exp {
  Var *var_;
  Exp *exp_;
  AssignExp(Var *v, Exp *e) :
    var_(v), exp_(e) {}
};

struct Dec : public ASTNode {};
struct VarDec : public Dec {
  Symbol *sym_, *typ_;
  Exp *init_;
};
struct FuncDec : public Dec {
  Symobl *name_, *result;
  std::vector<Field*> *params_;
  Exp *body_;
};

