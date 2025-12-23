enum Status {
  approved,
  pending,
  rejected
}

void main() {
  Status status = Status.approved;

  if(status == Status.approved) {
    print('승인 되었습니다');
  } else if(status == Status.pending) {
    print('대기 하세요');
  } else {
    print('거절 되었습니다');
  }
}