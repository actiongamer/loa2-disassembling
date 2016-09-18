package nslm2.modules.foundations.mainToolBar
{
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class MainToolBarChangeMsg
   {
      
      public static const MSG_MAIN_TOOL_BAR_ID:String = "msg_main_tool_bar_id";
      
      public static const LOTTERY_HERO_moduleIdArr:Array = [14000,11930];
      
      public static const Arena_moduleIdArr:Array = [30810,50220,50240];
      
      public static const PKCrossEntry_moduleIdArr:Array = [50247,50251,50249,50244];
      
      public static const PKCross_moduleIdArrVertical:Array = [50249];
      
      public static const PKCross_moduleIdArr:Array = [30810,11000,30701,50248,50251,50247,50244,9900004,50245];
      
      public static const PKCross_final_moduleIdArr:Array = [30810,11000,30701,50248,50247,50244,9900004,50246];
      
      public static const ShenYuan_moduleIdArr:Array = [30810,30500,11000,30701,41502,11306];
      
      public static const ResDg_moduleIdArr:Array = [30701,11000,30810];
      
      public static const Arena_moduleIdArrVertical:Array = [];
      
      public static const Chapter_moduleIdArr:Array = [30500,30810,11000,30701];
      
      public static const Chapter_moduleIdArrVertical:Array = [];
      
      public static const MainCity_moduleIdArr:Array = [40700,32000,30300,30600,30500,30810,11000,30701];
      
      public static const BattleField_moduleIdArr:Array = [50506,80100];
      
      public static const FamilyBoss_moduleIdArr:Array = [11000,30810,40700,40743];
      
      public static const WolrdBoss_moduleIdArr:Array = [11000,30810,41701];
      
      public static const MainCity_moduleIdArrVertical:Array = [11300,13000];
      
      public static const TEAM_GUAJI_moduleIdArr:Array = [30810,11000,30600,41212,41213,10623,41221,41224];
      
      public static const CHAMPIONSHIP_moduleIdArr:Array = [30500,30810,11000,30701];
       
      
      public var moduleIdArr:Array;
      
      public var moduleIdArrVertical:Array;
      
      public var showBackBtn:Boolean;
      
      public var showShopBtn:Boolean;
      
      public function MainToolBarChangeMsg(param1:Array, param2:Array, param3:Boolean, param4:Boolean = true)
      {
         super();
         this.moduleIdArr = param1;
         this.moduleIdArrVertical = param2;
         this.showBackBtn = param3;
         this.showShopBtn = param4;
      }
      
      public static function showMainCityStatic() : void
      {
         if(EnvConfig.ins.testAuthor == 99)
         {
            return;
         }
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10400);
         ModuleMgr.ins.showModule(10500);
         ModuleMgr.ins.showModule(10420);
         ModuleMgr.ins.showModule(10410);
         ModuleMgr.ins.showModule(10440);
         ModuleMgr.ins.showModule(10430);
         ModuleMgr.ins.showModule(10120);
         ModuleMgr.ins.showModule(41225);
         ModuleMgr.ins.showModule(10470);
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.MainCity_moduleIdArr,MainToolBarChangeMsg.MainCity_moduleIdArrVertical,false));
      }
   }
}
