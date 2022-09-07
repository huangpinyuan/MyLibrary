// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    /// 支持平台多少版本以上
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .tvOS(.v10),
        .watchOS(.v7)
    ],
    ///当前库的一些配置
    products: [

        .library(
            name: "MyLibrary",
            //动态库 or 静态库
            
            //默认为 静态库
            type: .static,
            targets: ["MyLibrary"]),
    ],
    ///依赖那些第三方
    dependencies: [
        /// 第三方有良好的版本格式： 主版本号.此版本号.修订号
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: .init(5, 0, 1)),
        /// 如果第三方版本格式是其他的，例如1.2 根本没有用到第三位 那我们也可以这样直接传入字符串
//        .package(url: "https://github.com/SnapKit/SnapKit.git", from: .init(stringLiteral: "5.0.1"))
        ///如果第三方目前的release版本还没有支持 SPM的话， 我们可以直接指向他的master 分支
//        .package(url: "https://github.com/SnapKit/SnapKit.git", Package.Dependency.Requirement.branchItem("master")),
        ///很显然也可以关联本地的能支持swiftPM的库
//        .package(path: "../HpyPackage"),
    ],
    targets: [
        //当前自己库的target
        .target(
            name: "MyLibrary",
            dependencies: [
//                关联的第三方
                "SnapKit"]),
        //测试的 target
        .testTarget(
            name: "MyLibraryTests",
            dependencies: ["MyLibrary"]),
    ],
    
    //库支持的swift 语言的版本
    swiftLanguageVersions: [
        .v5
    ]
)
