package nslm2.modules.foundations.ranks
{
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RankUtil
   {
       
      
      public var img_tubiao:String = null;
      
      public var img_waiwei:String = null;
      
      public var txt_wenzi:String = null;
      
      public var img_bg:String = null;
      
      public function RankUtil(param1:int, param2:String, param3:String, param4:String)
      {
         super();
         this.txt_wenzi = LocaleMgr.ins.getStr(String(param1));
         this.img_tubiao = param2;
         this.img_waiwei = param3;
         this.img_bg = param4;
      }
   }
}
