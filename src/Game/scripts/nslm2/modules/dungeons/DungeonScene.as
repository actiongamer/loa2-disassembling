package nslm2.modules.dungeons
{
   import game.ui.dungeonScene.DungeonSceneUI;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.modules.battles.battle.RightHeader;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class DungeonScene extends DungeonSceneUI
   {
      
      public static const MODE_NO_DUNGEON:int = 1;
       
      
      private var numScroll:nslm2.modules.dungeons.NumScroll;
      
      private var _timePaused:Boolean = true;
      
      private var _money:int;
      
      private var _leftAlive:int;
      
      private var _leftAll:int;
      
      private var _itemCount:int;
      
      private var _boNum:int;
      
      private var _boAll:int;
      
      private var _heroPieceCount:int;
      
      private var _equipPieceCount:int;
      
      private var _turnCount:int;
      
      public function DungeonScene()
      {
         super();
         this.itemCount = 0;
         this.heroPieceCount = 0;
         this.equipPieceCount = 0;
         this.rightHeader.visible = false;
         this.icon_equip_piece.toolTip = LocaleMgr.ins.getStr(40200006);
         this.txt_equip_piece.toolTip = LocaleMgr.ins.getStr(40200006);
         this.icon_hero_piece.toolTip = LocaleMgr.ins.getStr(40200005);
         this.txt_hero_piece.toolTip = LocaleMgr.ins.getStr(40200005);
         this.txt_item.toolTip = LocaleMgr.ins.getStr(40200002);
         this.icon_item.toolTip = LocaleMgr.ins.getStr(40200002);
         this.num_bo.toolTip = LocaleMgr.ins.getStr(40200003);
         this.num_bo_all.toolTip = LocaleMgr.ins.getStr(40200003);
         this.ui_left.toolTip = LocaleMgr.ins.getStr(40200004);
         numScroll = new nslm2.modules.dungeons.NumScroll(this.txt_turn);
         this.turnCount = 0;
         if(ClientConfig.firstBattle)
         {
            this.txt_turn_title.useTextMask = false;
            this.txt_turn_title.bg.visible = false;
            this.icon_bo.useTextMask = false;
            this.icon_bo.bg.visible = false;
            this.txt_survive.useTextMask = false;
            this.txt_survive.bg.visible = false;
         }
         this.icon_bo.toolTip = LocaleMgr.ins.getStr(40200003);
         this.btn_pause.visible = FuncOpenAutoCtrl.checkOpen(40256);
         lockAutoFight(false);
      }
      
      public function lockAutoFight(param1:Boolean) : void
      {
         if(param1)
         {
            this.img_autoLock.visible = true;
            this.btn_auto.mouseEvent = false;
         }
         else
         {
            this.img_autoLock.visible = false;
            this.btn_auto.mouseEvent = true;
         }
      }
      
      public function setMode(param1:int = 0) : void
      {
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               ui_left.visible = false;
               box_bo.visible = false;
               box_res.visible = false;
               btn_pause.x = box_bo.x;
         }
      }
      
      public function get timePaused() : Boolean
      {
         return _timePaused;
      }
      
      public function set timePaused(param1:Boolean) : void
      {
         _timePaused = param1;
         this.battleHeadPortrait.mouseEnabled = !param1;
         this.battleHeadPortrait.mouseChildren = !param1;
      }
      
      public function set leftAllNum(param1:int) : void
      {
         this.num_all.value = param1;
         _leftAll = param1;
      }
      
      public function set leftAlive(param1:int) : void
      {
         var _loc2_:int = 0;
         _leftAlive = param1;
         this.num_live.value = param1;
         if(_leftAlive <= 0)
         {
            setStar(0);
         }
         else
         {
            _loc2_ = 3 - (_leftAll - _leftAlive);
            _loc2_ = Math.max(0,_loc2_);
            setStar(_loc2_);
         }
      }
      
      public function setStar(param1:int) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            this["star" + _loc2_].visible = _loc2_ < param1;
            _loc2_++;
         }
      }
      
      public function get leftAlive() : int
      {
         return _leftAlive;
      }
      
      public function get itemCount() : int
      {
         return _itemCount;
      }
      
      public function initboNum(param1:int, param2:int) : void
      {
         _boNum = param1;
         _boAll = param2;
         this.num_bo.value = _boNum;
         this.num_bo_all.value = param2;
      }
      
      public function setboNext() : void
      {
         _boNum = Number(_boNum) + 1;
         this.num_bo.value = _boNum;
      }
      
      public function set itemCount(param1:int) : void
      {
         _itemCount = param1;
         this.txt_item.text = String(param1);
      }
      
      public function get heroPieceCount() : int
      {
         return _heroPieceCount;
      }
      
      public function set heroPieceCount(param1:int) : void
      {
         _heroPieceCount = param1;
         this.txt_hero_piece.text = param1 + "";
      }
      
      public function get equipPieceCount() : int
      {
         return _equipPieceCount;
      }
      
      public function set equipPieceCount(param1:int) : void
      {
         _equipPieceCount = param1;
         this.txt_equip_piece.text = param1 + "";
      }
      
      public function get turnCount() : int
      {
         return _turnCount;
      }
      
      public function set turnCount(param1:int) : void
      {
         _turnCount = param1;
         this.numScroll.value = param1;
      }
      
      public function initLeftUnit(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         setStar(3);
         leftAllNum = _loc3_;
         leftAlive = _loc3_;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            if(!_loc2_.isMajor)
            {
            }
            _loc4_++;
         }
         this.battleHeadPortrait.show(param1);
      }
      
      public function get rightHeader() : RightHeader
      {
         return this.rightHeaderUI as RightHeader;
      }
      
      public function showBossHeader(param1:UnitVo) : void
      {
         this.rightHeader.visible = true;
         this.rightHeader.unitVo = param1;
      }
      
      override public function dispose() : void
      {
         numScroll.dispose();
         super.dispose();
      }
   }
}
