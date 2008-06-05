#ifndef __TO_FROM_RUBY_H__
#define __TO_FROM_RUBY_H__

namespace to_from_ruby {
  
  // Const methods that return references need an explicit to_ruby
  // definition for the given type
  class MyType {
    public:
    int myValue;

    MyType() { myValue = 0; }

    // Exposing attributes not implemented yet
    int value() { return myValue; }
  };

  const MyType& needsToRuby(int value);

  // But rb++ should only make one to_ruby definition or the compiler
  // will poop
  const MyType& someOtherMethod(int value);

  // Should also work with class methods
  class WrappedClass {
    public:
      WrappedClass() {}

      const MyType& getMyType(int value) {
        MyType *type = new MyType();
        type->myValue = value;
        return *type;
      }
      
      const WrappedClass &overload() {
        return *this;
      }
    
      const WrappedClass &overload(int arg) {
        return *this;
      }
  };
  
  /* template tests */
  
  template<class T>
  class TemplateClass {
    T val;
    public:
      TemplateClass(T val) {
        this->val = val;
      }
      const T &overload() {
        return this->val;
      }
      const T &overload(int arg) {
        return this->val;
      }
  };
  
  inline const TemplateClass<int> &getTemplate() {
    return *(new TemplateClass<int>(1));
  }
  
  inline const TemplateClass<int> &getTemplate(int overload) {
    return *(new TemplateClass<int>(overload));
  }
}

#endif 