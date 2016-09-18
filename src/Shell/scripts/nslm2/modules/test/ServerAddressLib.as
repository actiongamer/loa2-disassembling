package nslm2.modules.test
{
   import com.mz.core.utils.DictHash;
   
   public class ServerAddressLib extends DictHash
   {
      
      private static var _ins:nslm2.modules.test.ServerAddressLib;
      
      public static const DEV:int = 0;
      
      public static const DEV_EN:int = 1;
      
      public static const DEV_TW:int = 2;
      
      public static const DEV_RU:int = 9;
      
      public static const DEV_JA:int = 10;
      
      public static const DEV_YUFEI_TW:int = 3;
      
      public static const DEV_XIAOZOU_TW:int = 4;
      
      public static const DEV_YUFEI_EN:int = 5;
      
      public static const DEV_XIAOZOU_EN:int = 6;
      
      public static const DEV_YIFAN_EN:int = 7;
      
      public static const DEV_YIFAN_TW:int = 8;
      
      public static const PROD_S0:int = 50;
      
      public static const PROD_S1:int = 51;
      
      public static const PROD_S2:int = 52;
       
      
      public function ServerAddressLib()
      {
         var _loc1_:* = null;
         super();
         _loc1_ = new ServerAddressVo(0,"开发服","192.168.240.163",3002,"2","tw","160");
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(1,"北美内网","192.168.240.163",4002,"1","en",160);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(5,"宇飞北美","192.168.240.163",4002,"2","en",160);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(6,"小邹北美","192.168.240.163",4002,"3","en",160);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(7,"一帆北美","192.168.240.163",4002,"4","en",160);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(2,"台湾内网","192.168.240.163",4102,"100","tw",162);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(3,"宇飞台湾","192.168.240.163",4102,"101","tw",162);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(4,"小邹台湾","192.168.240.163",4102,"102","tw",162);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(8,"一帆台湾","192.168.240.163",4102,"103","tw",162);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(9,"俄罗斯内网","192.168.240.163",4202,"100","ru",181);
         this.put(_loc1_.id,_loc1_);
         _loc1_ = new ServerAddressVo(10,"日语内网","192.168.240.163",4302,"100","ja",187);
         this.put(_loc1_.id,_loc1_);
      }
      
      public static function get ins() : nslm2.modules.test.ServerAddressLib
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.test.ServerAddressLib();
         }
         return _ins;
      }
   }
}
