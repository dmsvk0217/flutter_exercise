Function validateName() {
  return (value) {
    if (value.length < 4) {
      return "4글자 이상을 입력해주세요";
    }
    return null;
  };
}

Function validatePassword() {
  return (value) {
    if (value.length < 6) {
      return "6글자 이상을 입력해주세요";
    }
    return null;
  };
}
