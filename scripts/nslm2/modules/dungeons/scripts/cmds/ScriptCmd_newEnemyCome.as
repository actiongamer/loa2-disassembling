package nslm2.modules.dungeons.scripts.cmds
{
   import com.greensock.TimelineLite;
   import game.ui.dungeonScene.NewEnemyComeUI;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.mgrs.stcMgrs.vos.StcHeroDescVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import morn.core.components.Image;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.SoundMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.vo.SkillRenderVo;
   import com.greensock.easing.Back;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import nslm2.modules.Chapters.ChapterModel;
   
   public class ScriptCmd_newEnemyCome extends ScriptCmdBase
   {
       
      
      private var _tl:TimelineLite;
      
      private var _view:NewEnemyComeUI;
      
      private var _exitTime:int;
      
      public function ScriptCmd_newEnemyCome()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         play();
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
      }
      
      private function drawCover(param1:Rectangle = null) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(0,0.4);
         _loc2_.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         _loc2_.graphics.endFill();
         return _loc2_;
      }
      
      private function loadAsset() : void
      {
         var _loc1_:TaskPool = new TaskPool();
         _loc1_.addTask(new GetResTask(33,"ui/uiNewEnemy.uibaz"));
         _loc1_.addTask(new GetResTask(33,"ui/uiNewEnemy_" + App.language + ".uibaz"));
         _loc1_.addCompleteHandler(loadCmp);
         _loc1_.exec();
      }
      
      private function loadCmp() : void
      {
         playSound = function():void
         {
            var _loc1_:String = UrlLib.speakUrl(npcvo.speak,1);
            SoundMgr.ins.playTexiaoSound(_loc1_);
         };
         aniComp = function():void
         {
            _view.addEventListener("click",onClk);
            _exitTime = 15;
            TimerManager.ins.doLoop(1000,autoExit);
         };
         copyimg = function():void
         {
            img.skin = _view.img_new.skin;
            var _loc1_:* = 0.5;
            img.anchorY = _loc1_;
            img.anchorX = _loc1_;
            img.x = _view.img_new.x + _view.img_new.width / 2;
            img.y = _view.img_new.y + _view.img_new.height / 2;
            _view.img_new.parent.addChild(img);
         };
         showInfo = function():void
         {
            playSound();
            img.dispose();
            _view.img_new.visible = false;
            _view.box_info.visible = true;
         };
         _view = new NewEnemyComeUI();
         var mask:Sprite = drawCover();
         _view.addChildAt(mask,0);
         (this.module as DungeonSceneModule).addChild(_view);
         var _loc2_:* = 0;
         _view.right = _loc2_;
         _loc2_ = _loc2_;
         _view.left = _loc2_;
         _loc2_ = _loc2_;
         _view.bottom = _loc2_;
         _view.top = _loc2_;
         var data:StcHeroDescVo = StcMgr.ins.getHeroDescVo(int(vo.id));
         _view.txt_info.text = LocaleMgr.ins.getStr(data.desc_total);
         var npcvo:StcNpcVo = StcMgr.ins.getNpcVo(data.hero_id);
         _view.txt_name.text = LocaleMgr.ins.getStr(npcvo.name);
         _view.txt_name.color = ColorLib.qualityColor(npcvo.quality);
         var qutexts:Array = [0,6001,6002,6003,6004,6005,6006,6007];
         _view.txt_qulity.text = LocaleMgr.ins.getStr(qutexts[npcvo.quality]);
         _view.txt_qulity.color = ColorLib.qualityColor(npcvo.quality);
         _view.skill_info.dataSource = new SkillRenderVo(data.skill,data.hero_id);
         this._view.img_face.skin = UrlLib.dialog(npcvo.head_id);
         _view.img_group.skin = UrlLib.npcGroupImg(npcvo.group);
         _view.txt_group.text = LocaleMgr.ins.getStr(5100 + npcvo.group);
         _view.skill_info.toolTip = null;
         _view.skill_info.ref_txt_level.text = "";
         _view.box_info.visible = false;
         _view.mouseEnabled = true;
         _view.mouseChildren = true;
         var img:Image = new Image();
         _tl = new TimelineLite();
         _tl.from(_view.img_new,0.3,{
            "right":-_view.img_new.width,
            "ease":Back.easeOut
         });
         _tl.call(copyimg,null,"+=.4");
         _tl.to(img,0.2,{"alpha":0});
         _tl.to(mask,0.2,{"alpha":0},"-=0.2");
         _tl.to(img,0.2,{"alpha":1});
         _tl.to(mask,0.2,{"alpha":1},"-=0.2");
         _tl.to(img,0.2,{"alpha":0});
         _tl.to(mask,0.2,{"alpha":0},"-=0.2");
         _tl.to(img,0.2,{"alpha":1});
         _tl.to(mask,0.2,{"alpha":1},"-=0.2");
         _tl.to(img,0.2,{"alpha":0});
         _tl.to(mask,0.2,{"alpha":0},"-=0.2");
         _tl.to(img,0.2,{"alpha":1});
         _tl.to(mask,0.2,{"alpha":1},"-=0.2");
         _tl.to(img,0.4,{
            "alpha":0,
            "scaleX":2,
            "scaleY":2
         });
         _tl.to(_view.img_new,0.4,{"alpha":0},"-=0.2");
         _tl.call(showInfo);
         _tl.from(_view.img_bg,0.2,{"scaleX":0});
         _tl.from(_view.img_sbg,0.2,{
            "alpha":0,
            "scale":0,
            "rotation":180
         });
         _tl.from(_view.img_face,0.1,{"alpha":0});
         _tl.from(_view.img_up_line,0.2,{"alpha":0});
         _tl.from(_view.box_name,0.2,{
            "alpha":0,
            "x":_view.box_name.x - 20
         });
         _tl.from(_view.img_line,0.1,{"alpha":0});
         _tl.from(_view.img_info,0.2,{"alpha":0});
         _tl.from(_view.img_bar1,0.2,{"alpha":0},"-=.2");
         _tl.from(_view.img_down_line,0.2,{"alpha":0});
         _tl.from(_view.skill_info,0.2,{
            "alpha":0,
            "x":_view.skill_info.x - 20
         });
         _tl.from(_view.img_bar2,0.2,{"alpha":0});
         _tl.from(_view.txt_gotip,0.2,{"alpha":0});
         _tl.call(aniComp);
      }
      
      private function autoExit() : void
      {
         if(_exitTime == 0)
         {
            onClk(null);
         }
         _view.txt_gotip.text = LocaleMgr.ins.getStr(30100016) + "(" + _exitTime + ")";
         _exitTime = Number(_exitTime) - 1;
      }
      
      public function play() : void
      {
         if(needShow())
         {
            loadAsset();
         }
         else
         {
            this.onEnd();
         }
      }
      
      protected function onClk(param1:MouseEvent) : void
      {
         event = param1;
         onCmp = function():void
         {
            _view.dispose();
            onEnd();
         };
         _view.removeEventListener("click",onClk);
         TweenLite.to(_view.box_info,0.4,{
            "x":0 - _view.img_bg.width,
            "ease":Back.easeIn,
            "onComplete":onCmp
         });
         TimerManager.ins.clearTimer(autoExit);
      }
      
      private function needShow() : Boolean
      {
         var _loc2_:int = (this.module as DungeonSceneModule).dgVo.dungeonId;
         var _loc1_:Boolean = ChapterModel.ins.isStageCpl(_loc2_);
         return !_loc1_;
      }
   }
}
