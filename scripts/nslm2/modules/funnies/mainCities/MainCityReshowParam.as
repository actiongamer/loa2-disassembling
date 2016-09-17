package nslm2.modules.funnies.mainCities
{
   import flash.net.registerClassAlias;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import flash.utils.ByteArray;
   import morn.core.utils.BaUtil;
   
   public class MainCityReshowParam
   {
       
      
      public var needShowPanel:Boolean;
      
      public var chapterModuleInitVo:ChapterModuleInitVo;
      
      public var lastAttackChapterId:int;
      
      public var heroAwakenRoadModuleInitVo:ChapterModuleInitVo;
      
      public var showResDgId:int;
      
      public var needShowGuildDungeon:Boolean;
      
      public var needShowFirstCharge:Boolean = true;
      
      public var miniNoticeFirstShowed:Boolean;
      
      public var newerAlertCanShowStamp:int;
      
      public function MainCityReshowParam()
      {
         super();
      }
      
      public static function registerClassAliases() : void
      {
         registerClassAlias("nslm2.modules.funnies.mainCities.MainCityReshowParam",MainCityReshowParam);
      }
      
      public function toBa() : ByteArray
      {
         var _loc1_:ByteArray = BaUtil.createByteArray();
         _loc1_.writeObject(this);
         _loc1_.position = 0;
         return _loc1_;
      }
   }
}
