package nslm2.modules.foundations.gameHelp
{
   import game.ui.gameHelpModule.GameHelpModuleUI;
   import flash.events.MouseEvent;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.foundations.gameHelp.vo.GameHelpVo;
   
   public class GameHelpModule extends GameHelpModuleUI
   {
       
      
      public const QUESTION_START:int = 13200101;
      
      public const QUESTION_END:int = 13200150;
      
      public const TITLE_START:int = 13200001;
      
      public const ANSWER_START:int = 13200501;
      
      public const QUESTION_LIST1:int = 0;
      
      public const QUESTION_LIST2:int = 16;
      
      public const QUESTION_LIST3:int = 21;
      
      public const QUESTION_LIST4:int = 34;
      
      public const QUESTION_LIST5:int = 42;
      
      public const QUESTION_LIST6:int = 45;
      
      public const QUESTION_LIST7:int = 48;
      
      public function GameHelpModule()
      {
         super();
         linkTxt.addEventListener("click",linkTxtClick);
      }
      
      protected function linkTxtClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = {};
         _loc2_.account = ClientConfig.playId;
         _loc2_.gameId = ClientConfig.gameId;
         _loc2_.serverId = ClientConfig.district;
         _loc2_.role = PlayerModel.ins.playerInfo.name;
         _loc2_.level = PlayerModel.ins.level;
         _loc2_.lang = ClientConfig.language;
         _loc2_.isMod = PlayerModel.ins.playerInfo.gmType == 2?true:false;
         _loc2_.opId = EnvConfig.ins.ptId;
         CallJsMrg.ins.onInstructorJs(_loc2_);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9000000 + this.moduleId);
         this.img_bg.skin = UrlLib.getGameHelpImg("img_bg");
         this.list_title.repeatY = 7;
         var _loc2_:int = 13200001;
         if(ClientConfig.isChineseLang())
         {
            _loc2_ = 13200001;
            _loc2_++;
            _loc2_++;
            _loc2_++;
            _loc2_++;
            this.list_title.dataSource = [_loc2_,_loc2_,_loc2_,_loc2_,_loc2_];
         }
         else
         {
            _loc2_ = 13200001;
            _loc2_++;
            _loc2_++;
            _loc2_++;
            _loc2_++;
            _loc2_++;
            _loc2_++;
            this.list_title.dataSource = [_loc2_,_loc2_,_loc2_,_loc2_,_loc2_,_loc2_,_loc2_];
         }
         this.list_title.changeHandler = titleChangeHandler;
         this.list_help.dataSource = [];
         linkTxt.visible = false;
         super.preShow();
      }
      
      override public function show(param1:Object = null) : void
      {
         this.list_title.selectedIndex = 0;
         titleChangeHandler(0);
         super.show(param1);
      }
      
      private function titleChangeHandler(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         if(param1 < 6)
         {
            _loc5_ = this["QUESTION_LIST" + (param1 + 2)] - this["QUESTION_LIST" + (param1 + 1)];
         }
         else
         {
            _loc5_ = this["QUESTION_END"] - this["QUESTION_START"] - this["QUESTION_LIST" + (param1 + 1)];
         }
         var _loc2_:* = _loc5_;
         var _loc4_:Array = [];
         while(_loc5_ > 0)
         {
            _loc3_ = new GameHelpVo();
            _loc3_.question = 13200101 + this["QUESTION_LIST" + (param1 + 1)] + _loc2_ - _loc5_;
            _loc3_.answer = 13200501 + this["QUESTION_LIST" + (param1 + 1)] + _loc2_ - _loc5_;
            _loc5_--;
            _loc4_.push(_loc3_);
         }
         this.list_help.dataSource = _loc4_;
      }
      
      override public function dispose() : void
      {
         if(linkTxt.hasEventListener("click"))
         {
            linkTxt.removeEventListener("click",linkTxtClick);
         }
         super.dispose();
      }
   }
}
