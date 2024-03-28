/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null){
    this.val = (val===undefined ? 0 : val)
    this.next = (next===undefined ? null : next)
  }
}



function mergeInBetween(list1: ListNode | null, a: number, b: number, list2: ListNode | null): ListNode | null {
  // if (list1 === null || list2 === null) return null;
  let index:number = 0
  let current_node = list1;
  let start_node = list1;
  let end_node = null;

  while(current_node){
    if(index === a - 1){
      start_node = current_node;
    }
    if(index === b){
      end_node = current_node.next;
      break;
    }
    current_node = current_node.next;
    index++;
  }


  start_node.next = list2;
  current_node = list2;

  while(current_node.next){
    current_node = current_node.next;
  }

  current_node.next = end_node;
  return list1;
}


const testCases = [
  {
    list1: new ListNode(0, new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(5)))))),
    a: 3,
    b: 4,
    list2: new ListNode(1000000, new ListNode(1000001, new ListNode(1000002)))
  },
  {
    list1: new ListNode(0, new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(5, new ListNode(6))))))),
    a: 2,
    b: 5,
    list2: new ListNode(1000000, new ListNode(1000001, new ListNode(1000002, new ListNode(1000003, new ListNode(1000004)))))
  },
]

testCases.forEach((testCase, index) => {
  console.log(`Test Case ${index + 1}`);
  console.log(mergeInBetween(testCase.list1, testCase.a, testCase.b, testCase.list2));
})
