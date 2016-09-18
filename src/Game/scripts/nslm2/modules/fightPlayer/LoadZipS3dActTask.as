package nslm2.modules.fightPlayer
{
   import com.mz.core.utils2.task.TaskBase;
   import org.specter3d.display.avatar2.AvatarPart3D;
   import com.mz.core.utils2.task.TaskPool;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.res3ds.LoadZipAndAddAsset3DTask;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import com.greensock.TweenLite;
   import org.specter3d.display.avatar2.data.AnimData;
   import morn.core.utils.PathUtil;
   
   public class LoadZipS3dActTask extends TaskBase
   {
       
      
      public var avatar:AvatarPart3D;
      
      public var pathFolder:String;
      
      public var meshFolder:String;
      
      public var actArrType:int;
      
      public var bodyS3dPath:String;
      
      public var bodyTexPath:String;
      
      public var bothSides:Boolean;
      
      private var hasMesh:Boolean;
      
      public function LoadZipS3dActTask(param1:AvatarPart3D, param2:String, param3:String, param4:String, param5:String, param6:int, param7:Boolean)
      {
         super();
         if(param6 == 0)
         {
            param6 = 1;
         }
         this.avatar = param1;
         this.pathFolder = param2;
         this.meshFolder = param3;
         this.actArrType = param6;
         this.bodyS3dPath = param4;
         this.bodyTexPath = param5;
         this.bothSides = param7;
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         var _loc2_:TaskPool = new TaskPool();
         if(ClientConfig.firstBattle == 1 && ClientConfig.firstBattle_sub == 1 && this.actArrType != 11)
         {
            _loc1_ = pathFolder + "s3d_act_firstBattle.ba";
            _loc2_.addTask(new LoadZipAndAddAsset3DTask(this.pathFolder,_loc1_));
         }
         else
         {
            var _loc3_:* = this.actArrType;
            if(1 !== _loc3_)
            {
               if(11 !== _loc3_)
               {
                  if(55 === _loc3_)
                  {
                     _loc1_ = pathFolder + "s3d_act1.ba";
                     _loc2_.addTask(new LoadZipAndAddAsset3DTask(this.pathFolder,_loc1_));
                     _loc1_ = pathFolder + "s3d_act2.ba";
                     _loc2_.addTask(new LoadZipAndAddAsset3DTask(this.pathFolder,_loc1_));
                  }
               }
            }
            _loc1_ = pathFolder + "s3d_act1.ba";
            _loc2_.addTask(new LoadZipAndAddAsset3DTask(this.pathFolder,_loc1_));
         }
         if(this.meshFolder)
         {
            _loc1_ = meshFolder + "s3d_act1.ba";
            _loc2_.addTask(new LoadZipAndAddAsset3DTask(this.meshFolder,_loc1_));
         }
         _loc2_.stopWhenError = false;
         _loc2_.addCompleteHandler(taskPoolCpl);
         _loc2_.exec();
      }
      
      private function taskPoolCpl() : void
      {
         var _loc1_:* = null;
         if(isStop)
         {
            return;
         }
         if(avatar == null)
         {
            if(!AssetLib.hasAsset(bodyTexPath.replace(".png",".dxt")))
            {
               AppGlobalContext.asynLoader.loadOne(new ResourceVo(bodyTexPath.replace(".png",".dxt")));
            }
            this.onComplete();
            return;
         }
         if(avatar.isDispose)
         {
            this.onComplete();
            return;
         }
         var _loc2_:Array = [];
         if(ClientConfig.firstBattle == 1 && ClientConfig.firstBattle_sub == 1 && this.actArrType != 11)
         {
            _loc1_ = pathFolder + "s3d_act_firstBattle.ba";
            _loc2_ = AssetLib.getData(_loc1_) as Array;
         }
         else
         {
            var _loc3_:* = this.actArrType;
            if(1 !== _loc3_)
            {
               if(11 !== _loc3_)
               {
                  if(55 === _loc3_)
                  {
                     _loc1_ = pathFolder + "s3d_act1.ba";
                     _loc2_ = AssetLib.getData(_loc1_) as Array;
                     _loc1_ = pathFolder + "s3d_act2.ba";
                     _loc2_ = _loc2_.concat(AssetLib.getData(_loc1_));
                  }
               }
               addr125:
               if(this.meshFolder)
               {
                  _loc1_ = meshFolder + "s3d_act1.ba";
                  _loc2_ = _loc2_.concat(AssetLib.getData(_loc1_));
               }
            }
            _loc1_ = pathFolder + "s3d_act1.ba";
            _loc2_ = AssetLib.getData(_loc1_) as Array;
            §§goto(addr125);
         }
         if(_loc2_ == null)
         {
            this.onComplete();
            return;
         }
         TweenLite.delayedCall(1,delayRegAnims2,[_loc2_],true);
      }
      
      private function delayRegAnims2(param1:Array) : void
      {
         if(!avatar.isDispose)
         {
            this.avatar.registerAnims(getAnimDataVec(param1));
            if(hasMesh)
            {
               avatar.initAvatar(bodyS3dPath,bodyTexPath,"default_group",10,1,bothSides);
            }
         }
         this.onComplete();
      }
      
      private function getAnimDataVec(param1:Array) : Vector.<AnimData>
      {
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = param1.length;
         var _loc6_:Vector.<AnimData> = new Vector.<AnimData>();
         var _loc4_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc3_ = param1[_loc7_];
            if(_loc3_.indexOf(".act") > -1)
            {
               _loc5_ = new AnimData(PathUtil.parseNameWithoutSuffix(_loc3_));
               _loc5_.animUrl = this.pathFolder + _loc3_;
               _loc6_.push(_loc5_);
            }
            else if(_loc3_ == PathUtil.parseName(bodyS3dPath))
            {
               hasMesh = true;
            }
            _loc7_++;
         }
         return _loc6_;
      }
   }
}
