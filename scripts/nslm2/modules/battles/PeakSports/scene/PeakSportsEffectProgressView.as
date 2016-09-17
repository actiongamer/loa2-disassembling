package nslm2.modules.battles.PeakSports.scene
{
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.game.shared.component.NameTag3D;
   import flash.display.BitmapData;
   import morn.core.components.Label;
   import com.mz.core.configs.ClientConfig;
   import away3d.entities.Entity;
   
   public class PeakSportsEffectProgressView extends ObjectContainer3D
   {
       
      
      private var _specterEffect:SpecterEffect;
      
      private var _progressView:nslm2.modules.battles.PeakSports.scene.PeakSportsProgressView;
      
      public var _hpBarImage3D:Image3D;
      
      private var _oldEffectId:int;
      
      private var oldId:uint;
      
      private var oldSide:uint;
      
      public var _nameTag3D:NameTag3D;
      
      public function PeakSportsEffectProgressView()
      {
         super();
         progressValue(0,12);
      }
      
      public function showEffect(param1:int) : void
      {
         if(_oldEffectId == param1)
         {
            return;
         }
         _oldEffectId = param1;
         if(_specterEffect)
         {
            if(_specterEffect.parent)
            {
               _specterEffect.parent.removeChild(_specterEffect);
            }
            _specterEffect.dispose();
            _specterEffect = null;
         }
         _specterEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(param1),true,null,null,0,true,1);
         var _loc2_:Boolean = true;
         _specterEffect.mouseChildren = _loc2_;
         _specterEffect.mouseEnabled = _loc2_;
         _specterEffect.scaleAll = 2.8;
         this.addChild(_specterEffect);
      }
      
      public function progressValue(param1:int, param2:uint) : void
      {
         var _loc3_:int = PeakSportsTempType.getLimitProgress(param2);
         var _loc4_:Number = (_loc3_ + param1) / (_loc3_ * 2);
         showHpBar(_loc4_,param2);
         if(param1 == _loc3_)
         {
            showEffect(9000003);
            onMsg(param2,2);
         }
         else if(param1 == -_loc3_)
         {
            showEffect(9000004);
            onMsg(param2,1);
         }
         else
         {
            showEffect(9000002);
         }
      }
      
      private function onMsg(param1:uint, param2:uint) : void
      {
         if(oldId == param1 && oldSide == param2)
         {
            return;
         }
         oldId = param1;
         oldSide = param2;
         if(param1 == 9002)
         {
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600028,[LocaleMgr.ins.getStr(50500900 + param2)])));
         }
         else if(param1 == 9003)
         {
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600029,[LocaleMgr.ins.getStr(50500900 + param2)])));
         }
         else
         {
            PeakSportsMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(999600030,[LocaleMgr.ins.getStr(50500900 + param2)])));
         }
      }
      
      public function showHpBar(param1:Number, param2:uint) : void
      {
         if(_progressView == null)
         {
            _progressView = new nslm2.modules.battles.PeakSports.scene.PeakSportsProgressView();
         }
         _progressView.value(param1,param2);
         var _loc4_:BitmapData = new BitmapData(_progressView.width,_progressView.height,true,0);
         _loc4_.draw(_progressView,null,null,null,null,true);
         if(_hpBarImage3D == null)
         {
            _hpBarImage3D = new Image3D(null,_loc4_.width,_loc4_.height,0);
         }
         _hpBarImage3D.showByBmd(_loc4_);
         _hpBarImage3D.y = 160;
         this.addChild(_hpBarImage3D);
         var _loc5_:Label = new Label();
         _loc5_.width = _progressView.width;
         _loc5_.align = "center";
         _loc5_.style = "人名1不随品质变化";
         if(ClientConfig.isRuLang())
         {
            _loc5_.font = "Arial";
         }
         _loc5_.color = 16773888;
         if(param2 == 9002)
         {
            _loc5_.text = LocaleMgr.ins.getStr(999600025);
         }
         else if(param2 == 9003)
         {
            _loc5_.text = LocaleMgr.ins.getStr(999600026);
         }
         else
         {
            _loc5_.text = LocaleMgr.ins.getStr(999600027);
         }
         _loc5_.size = 14;
         var _loc3_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         _loc3_.draw(_loc5_,null,null,null,null,true);
         if(_nameTag3D == null)
         {
            _nameTag3D = new NameTag3D();
            _nameTag3D.y = _hpBarImage3D.y - _hpBarImage3D.height - 2;
            this.addChild(_nameTag3D);
            _nameTag3D.renderLayer = Entity.TOP_LAYER;
            _nameTag3D.mouseChildren = false;
            _nameTag3D.mouseEnabled = false;
            _nameTag3D.mousePriority = 4;
         }
         _nameTag3D.setBitmapData(_loc3_,true);
      }
      
      override public function dispose() : void
      {
         if(_specterEffect)
         {
            if(_specterEffect.parent)
            {
               _specterEffect.parent.removeChild(_specterEffect);
            }
            _specterEffect.dispose();
            _specterEffect = null;
         }
         if(_progressView)
         {
            _progressView.dispose();
            _progressView = null;
         }
         if(_hpBarImage3D)
         {
            if(_hpBarImage3D.parent)
            {
               _specterEffect.parent.removeChild(_hpBarImage3D);
            }
            _hpBarImage3D.dispose();
            _hpBarImage3D = null;
         }
         super.dispose();
      }
   }
}
