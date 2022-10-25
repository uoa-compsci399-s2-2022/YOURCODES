

CREATE DATABASE  IF NOT EXISTS `myproject` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myproject`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: myproject
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `problemdetaile`
--

DROP TABLE IF EXISTS `problemdetaile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problemdetaile` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `problemid` bigint DEFAULT NULL COMMENT 'problem',
  `input1` text COMMENT 'input1',
  `input2` text COMMENT 'input2',
  `output1` text COMMENT 'output1',
  `output2` text COMMENT 'output2',
  `code` text COMMENT 'code',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1584484141487542274 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemdetaile`
--

LOCK TABLES `problemdetaile` WRITE;
/*!40000 ALTER TABLE `problemdetaile` DISABLE KEYS */;
INSERT INTO `problemdetaile` VALUES (1577222352947658754,1664874086967,'nums = [2,7,11,15], target = 9','nums = [3,2,4], target = 6','[0,1]','[1,2]','class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        int n = nums.length;\n        for (int i = 0; i < n; ++i) {\n            for (int j = i + 1; j < n; ++j) {\n                if (nums[i] + nums[j] == target) {\n                    return new int[]{i, j};\n                }\n            }\n        }\n        return new int[0];\n    }\n}\n','Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.\r\n\r\nYou may assume that each input would have exactly one solution, and you may not use the same element twice.\r\n\r\nYou can return the answer in any order'),(1577227479997759489,1664875309355,'121','-121','true','false','class Solution {\n    public boolean isPalindrome(int x) {\n      \n        if (x < 0 || (x % 10 == 0 && x != 0)) {\n            return false;\n        }\n\n        int revertedNumber = 0;\n        while (x > revertedNumber) {\n            revertedNumber = revertedNumber * 10 + x % 10;\n            x /= 10;\n        }\n\n     return x == revertedNumber || x == revertedNumber / 10;\n    }\n}\n\n\n',NULL),(1577228035889840129,1664875441891,'height = [1,8,6,2,5,4,8,3,7]','height = [1,1]','49','1','public class Solution {\n    public int maxArea(int[] height) {\n        int l = 0, r = height.length - 1;\n        int ans = 0;\n        while (l < r) {\n            int area = Math.min(height[l], height[r]) * (r - l);\n            ans = Math.max(ans, area);\n            if (height[l] <= height[r]) {\n                ++l;\n            }\n            else {\n                --r;\n            }\n        }\n        return ans;\n    }\n}\n\n\n',NULL),(1577255048654618626,1664881882230,'nums1 = [1,3], nums2 = [2]','nums1 = [1,2], nums2 = [3,4]',' 2.00000','2.50000','public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n    int[] nums;\n    int m = nums1.length;\n    int n = nums2.length;\n    nums = new int[m + n];\n    if (m == 0) {\n        if (n % 2 == 0) {\n            return (nums2[n / 2 - 1] + nums2[n / 2]) / 2.0;\n        } else {\n\n            return nums2[n / 2];\n        }\n    }\n    if (n == 0) {\n        if (m % 2 == 0) {\n            return (nums1[m / 2 - 1] + nums1[m / 2]) / 2.0;\n        } else {\n            return nums1[m / 2];\n        }\n    }\n\n    int count = 0;\n    int i = 0, j = 0;\n    while (count != (m + n)) {\n        if (i == m) {\n            while (j != n) {\n                nums[count++] = nums2[j++];\n            }\n            break;\n        }\n        if (j == n) {\n            while (i != m) {\n                nums[count++] = nums1[i++];\n            }\n            break;\n        }\n\n        if (nums1[i] < nums2[j]) {\n            nums[count++] = nums1[i++];\n        } else {\n            nums[count++] = nums2[j++];\n        }\n    }\n\n    if (count % 2 == 0) {\n        return (nums[count / 2 - 1] + nums[count / 2]) / 2.0;\n    } else {\n        return nums[count / 2];\n    }\n}','Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.\n\nThe overall run time complexity should be O(log (m+n)).\n'),(1577264475730370561,1664884129817,'s = \"()\"','s = \"()[]{}\"','true','true','class Solution:\n    def isValid(self, s: str) -> bool:\n        dic = {\'{\': \'}\',  \'[\': \']\', \'(\': \')\', \'?\': \'?\'}\n        stack = [\'?\']\n        for c in s:\n            if c in dic: stack.append(c)\n            elif dic[stack.pop()] != c: return False \n        return len(stack) == 1','Given a string s containing just the characters \'(\', \')\', \'{\', \'}\', \'[\' and \']\', determine if the input string is valid.\n\nAn input string is valid if:\n\n1：Open brackets must be closed by the same type of brackets.\n2：Open brackets must be closed in the correct order.\n3：Every close bracket has a corresponding open bracket of the same type.'),(1577554400509988866,1664953253265,'nums = [-1,0,1,2,-1,-4]','[0,1,1]','[[-1,-1,2],[-1,0,1]]','[]','class Solution:\n    def threeSum(self, nums: List[int]) -> List[List[int]]:\n        \n        n=len(nums)\n        res=[]\n        if(not nums or n<3):\n            return []\n        nums.sort()\n        res=[]\n        for i in range(n):\n            if(nums[i]>0):\n                return res\n            if(i>0 and nums[i]==nums[i-1]):\n                continue\n            L=i+1\n            R=n-1\n            while(L<R):\n                if(nums[i]+nums[L]+nums[R]==0):\n                    res.append([nums[i],nums[L],nums[R]])\n                    while(L<R and nums[L]==nums[L+1]):\n                        L=L+1\n                    while(L<R and nums[R]==nums[R-1]):\n                        R=R-1\n                    L=L+1\n                    R=R-1\n                elif(nums[i]+nums[L]+nums[R]>0):\n                    R=R-1\n                else:\n                    L=L+1\n        return res',' Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.  Notice that the solution set must not contain duplicate triplets.'),(1577558930786111490,1664954333371,' head = [1,2,3,4]','[]','[2,1,4,3]','[]','class Solution {\n    public ListNode swapPairs(ListNode head) {\n        if (head == null || head.next == null) {\n            return head;\n        }\n        ListNode newHead = head.next;\n        head.next = swapPairs(newHead.next);\n        newHead.next = head;\n        return newHead;\n    }\n}','Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list\'s nodes (i.e., only nodes themselves may be changed.)'),(1584087631365066754,1666510896888,'','','','','',''),(1584153679854546946,1666526644079,'dividend = 10, divisor = 3','dividend = 7, divisor = -3','3','-2','class Solution:\r\n    def divide(self, dividend: int, divisor: int) -> int:\r\n        if dividend == -2147483648 and divisor == -1:\r\n            return 2147483647\r\n        a, b, res = abs(dividend), abs(divisor), 0\r\n        for i in range(31, -1, -1):\r\n            if (b << i) <= a:\r\n                res += 1 << i\r\n                a -= b << i\r\n        return res if (dividend > 0) == (divisor > 0) else -res\r\n\r\n','Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.  The integer division should truncate toward zero, which means losing its fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2.  Return the quotient after dividing dividend by divisor.'),(1584154804284534786,1666526912174,'123','1234','321','4321','print(1)','hi'),(1584157932027305985,1666527657877,'111','222','111','222','print(\"hello world\")','wrtite'),(1584161129408159746,1666528420198,'1','3333','2','444','public class HelloWorld {\r\n    public static void main(String[] args) {\r\n        System.out.println(\"Hello World\");\r\n    }\r\n}','2'),(1584161913210368001,1666528607057,'asd','adsa','asda','asdsa','print(1)','asd'),(1584162423803944962,1666528728793,'qeq','asdas','qwe','adweq','',''),(1584477999713669122,1666603967956,'123','1234','6','8','print(\"hello world\")','this problem'),(1584484141487542273,1666605432289,'123','1234','6','10','print(\"hello world\")','this quesiton');
/*!40000 ALTER TABLE `problemdetaile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_discuss`
--

DROP TABLE IF EXISTS `tb_discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_discuss` (
  `id` int DEFAULT NULL,
  `problemid` bigint DEFAULT NULL,
  `discussdetaile` text,
  `time` datetime DEFAULT NULL COMMENT 'time',
  `discussdeuser` varchar(50) DEFAULT NULL COMMENT 'commenter'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_discuss`
--

LOCK TABLES `tb_discuss` WRITE;
/*!40000 ALTER TABLE `tb_discuss` DISABLE KEYS */;
INSERT INTO `tb_discuss` VALUES (0,1664874086967,'very good','2022-10-05 03:26:23','admin'),(0,1664881882230,'very good','2022-10-05 11:43:35','admin'),(0,1664881882230,'very good','2022-10-05 11:55:37','tom'),(0,1664881882230,'very good','2022-10-05 11:56:19','tom'),(0,1664874086967,'very good','2022-10-13 12:37:43','jack'),(0,1664874086967,'good\n','2022-10-24 00:58:10','tom'),(0,1666526644079,'good','2022-10-24 01:04:21','admin'),(0,1666526912174,'good','2022-10-24 01:09:25','tom'),(0,1664874086967,'good!\n','2022-10-24 22:33:13','tom'),(0,1664874086967,'goood!','2022-10-24 22:57:22','tom');
/*!40000 ALTER TABLE `tb_discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_problem`
--

DROP TABLE IF EXISTS `tb_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_problem` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) DEFAULT NULL COMMENT 'Title',
  `solution` int DEFAULT '0' COMMENT 'Solution',
  `difficulty` varchar(50) DEFAULT NULL COMMENT 'Difficulty',
  `submissions` int DEFAULT NULL COMMENT 'Submissions',
  `rating` double(10,3) DEFAULT NULL COMMENT 'Rating',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `topics` varchar(50) DEFAULT NULL COMMENT 'Algorithms',
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1666605432290 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_problem`
--

LOCK TABLES `tb_problem` WRITE;
/*!40000 ALTER TABLE `tb_problem` DISABLE KEYS */;
INSERT INTO `tb_problem` VALUES (1664874086967,'1. Two Sum',4,'Easy',7,4.000,'1;2;4;','Algorithms','admin'),(1664875309355,'9. Palindrome Number',3,'Medium',0,3.500,'1;3;7;','Algorithms','admin'),(1664875441891,'11. Container With Most Water',2,'Easy',0,0.000,'1;3;7;','Algorithms','admin'),(1664881882230,'4. Median of Two Sorted Arrays',1,'Hard',3,4.500,'1;2;7;14;','Mathematics','admin'),(1664884129817,'20. Valid Parentheses',1,'Easy',0,0.000,'1;2;3;','Mathematics','tom'),(1664953253265,'15. 3Sum',0,'Medium',0,0.000,'5;8;','Algorithms','admin'),(1664954333371,'24. Swap Nodes in Pairs',0,'Medium',0,0.000,'6;8;','Algorithms','admin'),(1666526644079,'29. Divide Two Integers',2,'',1,3.500,'','','admin'),(1666526912174,'12.reverse',NULL,'Easy',1,3.000,'8;','Algorithms','admin'),(1666528420198,'22252',NULL,'Medium',0,0.000,'8;9;','Databases','admin'),(1666528607057,'sadad',NULL,'Medium',0,0.000,'9;17;','Databases','admin'),(1666528728793,'asdas',NULL,'',0,0.000,'','','admin'),(1666603967956,'two sum',0,'Easy',0,0.000,'6;7;8;','Algorithms','admin');
/*!40000 ALTER TABLE `tb_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_problemcode`
--

DROP TABLE IF EXISTS `tb_problemcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_problemcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `problem` bigint DEFAULT NULL,
  `code` text,
  `username` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_problemcode`
--

LOCK TABLES `tb_problemcode` WRITE;
/*!40000 ALTER TABLE `tb_problemcode` DISABLE KEYS */;
INSERT INTO `tb_problemcode` VALUES (1,1664875441891,'import java.util.Arrays;\n\npublic class Charu {\n    public static void main(String[] args) {\n        int []  nums={10,8,5,6,7,2,9,1};\n        int a1=0;\n        int index=0;\n        for(int i=1;i<nums.length;i++){\n                        index=i-1\n','admin','2022-10-06 16:18:10',NULL),(2,1664875309355,'class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        int n = nums.length;\n        for (int i = 0; i < n; ++i) {\n            for (int j = i + 1; j < n; ++j) {\n                if (nums[i] + nums[j] == target) {\n                    return new int[]{i, j};\n                }\n            }\n        }\n        return new int[0];\n    }\n}\n','admin','2022-10-06 18:10:46',NULL),(3,1664874086967,'import java.util.Arrays;\r\n\r\n/**\r\n * @author Administrator\r\n */\r\npublic class Charu2 {\r\n    public static void main(String[] args) {\r\n        int []  nums={10,8,5,6,7,2,9,1};\r\n        int indexnumber =0;\r\n        int index=0;\r\n        for(int i=1;i<nums.length;i++){\r\n            indexnumber =nums[i];\r\n            index=i-1;\r\n            while(index>=0&&indexnumber<nums[index]){\r\n                nums[index+1]=nums[index];\r\n                index--;\r\n            }\r\n            nums[index+1]=indexnumber;\r\n        }\r\n        System.out.println(Arrays.toString(nums));\r\n    }\r\n\r\n}\r\n//新提交代码','admin','2022-10-06 18:52:03',NULL),(4,1664874086967,'def twoSum(nums, target):\r\n    lens = len(nums)\r\n    j=-1\r\n    for i in range(lens):\r\n        if (target - nums[i]) in nums:\r\n            if (nums.count(target - nums[i]) == 1)&(target - nums[i] == nums[i]):#如果num2=num1,且nums中只出现了一次，说明找到是num1本身。\r\n                continue\r\n            else:\r\n                j = nums.index(target - nums[i],i+1) #index(x,i+1)是从num1后的序列后找num2                \r\n                break\r\n    if j>0:\r\n        return [i,j]\r\n    else:\r\n        return []\r\n\r\nfinal=twoSum([2,7,11,15], 9)\r\nprint(final)','','2022-10-11 16:13:36','python'),(5,1664874086967,'def twoSum(nums, target):\r\n    lens = len(nums)\r\n    j=-1\r\n    for i in range(lens):\r\n        if (target - nums[i]) in nums:\r\n            if (nums.count(target - nums[i]) == 1)&(target - nums[i] == nums[i]):\r\n                continue\r\n            else:\r\n                j = nums.index(target - nums[i],i+1)                \r\n                break\r\n    if j>0:\r\n        return [i,j]\r\n    else:\r\n        return []\r\n\r\nfinal=twoSum([2,7,11,15], 9)\r\nprint(final)','tom','2022-10-11 16:14:56','python'),(6,1664874086967,'print(1)','jack','2022-10-13 12:38:30','python'),(7,1664875441891,'print(1)','tom','2022-10-24 01:06:58','python'),(8,1664875309355,'print(\"hello world\")','jack','2022-10-24 01:11:50','python'),(9,1664884129817,'print(\"a\")','jack','2022-10-24 01:19:41',''),(10,1666526644079,'print(\"hello world\")','tom','2022-10-24 01:35:29','python'),(11,1664875309355,'print(\"hello world\")','tom','2022-10-24 22:33:43','python'),(12,1664881882230,'print(\"hello world\")','tom','2022-10-24 22:57:58','python');
/*!40000 ALTER TABLE `tb_problemcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_score`
--

DROP TABLE IF EXISTS `tb_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `problemid` bigint DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_score`
--

LOCK TABLES `tb_score` WRITE;
/*!40000 ALTER TABLE `tb_score` DISABLE KEYS */;
INSERT INTO `tb_score` VALUES (8,1664874086967,'admin',5),(9,1664875309355,'admin',4),(10,1664881882230,'admin',4),(11,1664881882230,'tom',5),(12,1664874086967,'jack',4),(13,1666526644079,'admin',4),(14,1666526644079,'tom',3),(15,1666526912174,'tom',3),(16,1664875309355,'tom',3),(17,1664874086967,'tom',3);
/*!40000 ALTER TABLE `tb_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) DEFAULT NULL COMMENT 'userName',
  `password` varchar(50) DEFAULT NULL COMMENT 'passWord',
  `email` varchar(50) DEFAULT NULL COMMENT 'email',
  `phone` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `selfintroduction` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'tom','123','123456@qq.com','123456','2 Year','hi, i like java.'),(2,'admin','admin1','1454486789@qq.com','132071111','2 Year','my name is adminadmin'),(12,'admin1','1444','1454486723@qq.com',NULL,NULL,NULL),(16,'frankie','123456','123456789@qq.com','hihhi','2 Year','hello');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 13:14:33
