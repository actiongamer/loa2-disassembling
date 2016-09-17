package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class StcFacebookFeedVo extends StcVoBase
   {
      
      public static const feedType:String = "feedType";
      
      public static const para_1:String = "para_1";
      
      public static const para_2:String = "para_2";
      
      public static const para_3:String = "para_3";
      
      public static const para_4:String = "para_4";
      
      public static const PRIMARY_KEY:String = "ID";
      
      public static const STC_NAME:String = "static_facebook_feed";
       
      
      public var ID:int;
      
      public var feedType:int;
      
      public var link:String;
      
      public var name:String;
      
      public var description:String;
      
      public var caption:String;
      
      public var picture:String;
      
      public var icon:String;
      
      public var action:String;
      
      public var status:int;
      
      public var sdkType:int;
      
      public var para_1:String;
      
      public var para_2:String;
      
      public var para_3:String;
      
      public var para_4:String;
      
      public var comment:String;
      
      public function StcFacebookFeedVo()
      {
         super();
      }
      
      public function get picture1() : String
      {
         var _loc1_:String = "http:" + UrlLib.fbPictureUrl + picture;
         return _loc1_;
      }
      
      public function set picture1(param1:String) : void
      {
         picture = param1;
      }
      
      override public function parse(param1:Array) : void
      {
         ID = param1[0];
         feedType = param1[1];
         link = param1[2];
         name = param1[3];
         description = param1[4];
         caption = param1[5];
         picture = param1[6];
         icon = param1[7];
         action = param1[8];
         status = param1[9];
         sdkType = param1[10];
         para_1 = param1[11];
         para_2 = param1[12];
         para_3 = param1[13];
         para_4 = param1[14];
         comment = param1[15];
      }
   }
}
