

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myproject` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myproject`;

/*Table structure for table `problemdetaile` */

DROP TABLE IF EXISTS `problemdetaile`;

CREATE TABLE `problemdetaile` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `problemid` bigint(11) DEFAULT NULL COMMENT 'problem',
  `input1` text COMMENT 'input1',
  `input2` text COMMENT 'input2',
  `output1` text COMMENT 'output1',
  `output2` text COMMENT 'output2',
  `code` text COMMENT 'code',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1579750117097926659 DEFAULT CHARSET=utf8;

/*Data for the table `problemdetaile` */

insert  into `problemdetaile`(`id`,`problemid`,`input1`,`input2`,`output1`,`output2`,`code`,`description`) values (1577222352947658754,1664874086967,'nums = [2,7,11,15], target = 9','nums = [3,2,4], target = 6','[0,1]','[1,2]','class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        int n = nums.length;\n        for (int i = 0; i < n; ++i) {\n            for (int j = i + 1; j < n; ++j) {\n                if (nums[i] + nums[j] == target) {\n                    return new int[]{i, j};\n                }\n            }\n        }\n        return new int[0];\n    }\n}\n','Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.\r\n\r\nYou may assume that each input would have exactly one solution, and you may not use the same element twice.\r\n\r\nYou can return the answer in any order'),(1577227479997759489,1664875309355,'121','-121','true','false','class Solution {\n    public boolean isPalindrome(int x) {\n      \n        if (x < 0 || (x % 10 == 0 && x != 0)) {\n            return false;\n        }\n\n        int revertedNumber = 0;\n        while (x > revertedNumber) {\n            revertedNumber = revertedNumber * 10 + x % 10;\n            x /= 10;\n        }\n\n     return x == revertedNumber || x == revertedNumber / 10;\n    }\n}\n\n\n',NULL),(1577228035889840129,1664875441891,'height = [1,8,6,2,5,4,8,3,7]','height = [1,1]','49','1','public class Solution {\n    public int maxArea(int[] height) {\n        int l = 0, r = height.length - 1;\n        int ans = 0;\n        while (l < r) {\n            int area = Math.min(height[l], height[r]) * (r - l);\n            ans = Math.max(ans, area);\n            if (height[l] <= height[r]) {\n                ++l;\n            }\n            else {\n                --r;\n            }\n        }\n        return ans;\n    }\n}\n\n\n',NULL),(1577255048654618626,1664881882230,'nums1 = [1,3], nums2 = [2]','nums1 = [1,2], nums2 = [3,4]',' 2.00000','2.50000','public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n    int[] nums;\n    int m = nums1.length;\n    int n = nums2.length;\n    nums = new int[m + n];\n    if (m == 0) {\n        if (n % 2 == 0) {\n            return (nums2[n / 2 - 1] + nums2[n / 2]) / 2.0;\n        } else {\n\n            return nums2[n / 2];\n        }\n    }\n    if (n == 0) {\n        if (m % 2 == 0) {\n            return (nums1[m / 2 - 1] + nums1[m / 2]) / 2.0;\n        } else {\n            return nums1[m / 2];\n        }\n    }\n\n    int count = 0;\n    int i = 0, j = 0;\n    while (count != (m + n)) {\n        if (i == m) {\n            while (j != n) {\n                nums[count++] = nums2[j++];\n            }\n            break;\n        }\n        if (j == n) {\n            while (i != m) {\n                nums[count++] = nums1[i++];\n            }\n            break;\n        }\n\n        if (nums1[i] < nums2[j]) {\n            nums[count++] = nums1[i++];\n        } else {\n            nums[count++] = nums2[j++];\n        }\n    }\n\n    if (count % 2 == 0) {\n        return (nums[count / 2 - 1] + nums[count / 2]) / 2.0;\n    } else {\n        return nums[count / 2];\n    }\n}','Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.\n\nThe overall run time complexity should be O(log (m+n)).\n'),(1577264475730370561,1664884129817,'s = \"()\"','s = \"()[]{}\"','true','true','class Solution:\n    def isValid(self, s: str) -> bool:\n        dic = {\'{\': \'}\',  \'[\': \']\', \'(\': \')\', \'?\': \'?\'}\n        stack = [\'?\']\n        for c in s:\n            if c in dic: stack.append(c)\n            elif dic[stack.pop()] != c: return False \n        return len(stack) == 1','Given a string s containing just the characters \'(\', \')\', \'{\', \'}\', \'[\' and \']\', determine if the input string is valid.\n\nAn input string is valid if:\n\n1：Open brackets must be closed by the same type of brackets.\n2：Open brackets must be closed in the correct order.\n3：Every close bracket has a corresponding open bracket of the same type.'),(1577554400509988866,1664953253265,'nums = [-1,0,1,2,-1,-4]','[0,1,1]','[[-1,-1,2],[-1,0,1]]','[]','class Solution:\n    def threeSum(self, nums: List[int]) -> List[List[int]]:\n        \n        n=len(nums)\n        res=[]\n        if(not nums or n<3):\n            return []\n        nums.sort()\n        res=[]\n        for i in range(n):\n            if(nums[i]>0):\n                return res\n            if(i>0 and nums[i]==nums[i-1]):\n                continue\n            L=i+1\n            R=n-1\n            while(L<R):\n                if(nums[i]+nums[L]+nums[R]==0):\n                    res.append([nums[i],nums[L],nums[R]])\n                    while(L<R and nums[L]==nums[L+1]):\n                        L=L+1\n                    while(L<R and nums[R]==nums[R-1]):\n                        R=R-1\n                    L=L+1\n                    R=R-1\n                elif(nums[i]+nums[L]+nums[R]>0):\n                    R=R-1\n                else:\n                    L=L+1\n        return res',' Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.  Notice that the solution set must not contain duplicate triplets.'),(1577558930786111490,1664954333371,' head = [1,2,3,4]','[]','[2,1,4,3]','[]','class Solution {\n    public ListNode swapPairs(ListNode head) {\n        if (head == null || head.next == null) {\n            return head;\n        }\n        ListNode newHead = head.next;\n        head.next = swapPairs(newHead.next);\n        newHead.next = head;\n        return newHead;\n    }\n}','Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list\'s nodes (i.e., only nodes themselves may be changed.)'),(1579750117097926658,1665476752903,'','','','','name=\"zxn\"\r\nsex=\"女\"\r\nage=16\r\nschool=\"xzcx\"\r\nnumber=\"2153025546\"\r\nprint(name,sex,age,school,number)','');

/*Table structure for table `tb_discuss` */

DROP TABLE IF EXISTS `tb_discuss`;

CREATE TABLE `tb_discuss` (
  `id` int(11) DEFAULT NULL,
  `problemid` bigint(20) DEFAULT NULL,
  `discussdetaile` text,
  `time` datetime DEFAULT NULL COMMENT 'time',
  `discussdeuser` varchar(50) DEFAULT NULL COMMENT 'commenter'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_discuss` */

insert  into `tb_discuss`(`id`,`problemid`,`discussdetaile`,`time`,`discussdeuser`) values (0,1664874086967,'very good','2022-10-05 03:26:23','admin'),(0,1664881882230,'very good','2022-10-05 11:43:35','admin'),(0,1664881882230,'very good','2022-10-05 11:55:37','tom'),(0,1664881882230,'very good','2022-10-05 11:56:19','tom');

/*Table structure for table `tb_problem` */

DROP TABLE IF EXISTS `tb_problem`;

CREATE TABLE `tb_problem` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) DEFAULT NULL COMMENT 'Title',
  `solution` int(50) DEFAULT 0 COMMENT 'Solution',
  `difficulty` varchar(50) DEFAULT NULL COMMENT 'Difficulty',
  `submissions` int(11) DEFAULT NULL COMMENT 'Submissions',
  `rating` double(10,3) DEFAULT NULL COMMENT 'Rating',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `topics` varchar(50) DEFAULT NULL COMMENT 'Algorithms',
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1665476752904 DEFAULT CHARSET=utf8;

/*Data for the table `tb_problem` */

insert  into `tb_problem`(`id`,`title`,`solution`,`difficulty`,`submissions`,`rating`,`type`,`topics`,`user`) values (1664874086967,'1. Two Sum',1,'Easy',3,5.000,'1;2;4;','Algorithms','admin'),(1664875309355,'9. Palindrome Number',1,'Medium',0,4.000,'1;3;7;','Algorithms','admin'),(1664875441891,'11. Container With Most Water',1,'Easy',0,0.000,'1;3;7;','Algorithms','admin'),(1664881882230,'4. Median of Two Sorted Arrays',0,'Hard',3,4.500,'1;2;7;14;','Mathematics','admin'),(1664884129817,'20. Valid Parentheses',0,'Easy',0,0.000,'1;2;3;','Mathematics','tom'),(1664953253265,'15. 3Sum',0,'Medium',0,0.000,'5;8;','Algorithms','admin'),(1664954333371,'24. Swap Nodes in Pairs',0,'Medium',0,0.000,'6;8;','Algorithms','admin');

/*Table structure for table `tb_problemcode` */

DROP TABLE IF EXISTS `tb_problemcode`;

CREATE TABLE `tb_problemcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem` bigint(20) DEFAULT NULL,
  `code` text,
  `username` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_problemcode` */

insert  into `tb_problemcode`(`id`,`problem`,`code`,`username`,`time`,`lang`) values (1,1664875441891,'import java.util.Arrays;\n\npublic class Charu {\n    public static void main(String[] args) {\n        int []  nums={10,8,5,6,7,2,9,1};\n        int a1=0;\n        int index=0;\n        for(int i=1;i<nums.length;i++){\n                        index=i-1\n','admin','2022-10-06 16:18:10',NULL),(2,1664875309355,'class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        int n = nums.length;\n        for (int i = 0; i < n; ++i) {\n            for (int j = i + 1; j < n; ++j) {\n                if (nums[i] + nums[j] == target) {\n                    return new int[]{i, j};\n                }\n            }\n        }\n        return new int[0];\n    }\n}\n','tom','2022-10-06 18:10:46',NULL),(3,1664874086967,'import java.util.Arrays;\r\n\r\n/**\r\n * @author Administrator\r\n */\r\npublic class Charu2 {\r\n    public static void main(String[] args) {\r\n        int []  nums={10,8,5,6,7,2,9,1};\r\n        int indexnumber =0;\r\n        int index=0;\r\n        for(int i=1;i<nums.length;i++){\r\n            indexnumber =nums[i];\r\n            index=i-1;\r\n            while(index>=0&&indexnumber<nums[index]){\r\n                nums[index+1]=nums[index];\r\n                index--;\r\n            }\r\n            nums[index+1]=indexnumber;\r\n        }\r\n        System.out.println(Arrays.toString(nums));\r\n    }\r\n\r\n}\r\n//新提交代码','peate','2022-10-06 18:52:03',NULL);

/*Table structure for table `tb_score` */

DROP TABLE IF EXISTS `tb_score`;

CREATE TABLE `tb_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problemid` bigint(20) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tb_score` */

insert  into `tb_score`(`id`,`problemid`,`user`,`score`) values (8,1664874086967,'admin',5),(9,1664875309355,'admin',4),(10,1664881882230,'admin',4),(11,1664881882230,'tom',5);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) DEFAULT NULL COMMENT 'username',
  `password` varchar(50) DEFAULT NULL COMMENT 'password',
  `email` varchar(50) DEFAULT NULL COMMENT 'email',
  `phone` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `selfintroduction` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`username`,`password`,`email`,`phone`,`sex`,`selfintroduction`) values (1,'tom','123','1454486758@qq.com','13207178','man','11'),(2,'admin','admin1','1454486789@qq.com','13207178147','man','my name is adminadmin'),(8,'peate','123456','455487@qq.com','13207178125','man','no'),(12,'admin1','1444','1454486723@qq.com','13207178145','man','no');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
