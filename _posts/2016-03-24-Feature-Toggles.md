---
layout: post
title: Feature Toggles
tags: toggles
---

## Feature Toggles
These should be short lived toggles (so before a feature is DONE, the toggle needs to be removed!)
Make the implementation as simple as possible
They should be your last choice when you're dealing with putting features into production. 

Your first choice should be to break the feature down so you can safely introduce parts of the feature into the product. The advantages of doing this are the same ones as any strategy based on small, frequent releases. You reduce the risk of things going wrong and you get valuable feedback on how users actually use the feature that will improve the enhancements you make later.

Whys:
- hide incomplete or risky features 
- control what features are available to different users
- makes merge problems go away
- eliminates the costs of maintaining and supporting long-lived branches
- reduce deployment risk: code active for certain users, some systems, limit exposure

Disadvantages:
- introduces technical debt (have to remove them, tests should will break when you do remove them)
- If you repurpose/reuse a flag you are [doing it wrong!](https://dougseven.com/2014/04/17/knightmare-a-devops-cautionary-tale/) 
- Review flags often - code reviews should be looking to kill feature toggles

# Toggle Types
## Flow Toggles
- application controlled, method flow, factory creation, dependency injection

## Permission Toggles (Canary Release/sneak preview)
- Add users to particular group
- white list users
- white list ip
- [asp.net Authorization](https://msdn.microsoft.com/en-us/library/wce3kxhd.aspx)
- [.net core authorization](https://docs.asp.net/en/latest/security/authorization/index.html)

## Experiment Toggles - A/B testing aka Red/Black testing
used to perform multivariate or A/B testing. Each user of the system is placed into a cohort and at runtime the Toggle Router will consistently send a given user down one codepath or the other, based upon which cohort they are in. By tracking the aggregate behavior of different cohorts we can compare the effect of different codepaths. This technique is commonly used to make data-driven optimizations to things such as the purchase flow of an ecommerce system
- Traffic distribution
- white list users (asp.net authorization)
- white list ip

## Business Toggles
- features to make available to end users long term or for pay style.

# Flow Toggles - Method

	function reticulateSplines(){
	var useNewAlgorithm = false;
	// useNewAlgorithm = true; // UNCOMMENT IF YOU ARE WORKING ON THE NEW SR ALGORITHM
	
	if( useNewAlgorithm ){
	  return enhancedSplineReticulation();
	}else{
	  return oldFashionedSplineReticulation();
	}
	}
	
	function oldFashionedSplineReticulation(){
	// current implementation lives here
	}
	
	function enhancedSplineReticulation(){
	// TODO: implement better SR algorithm
	}

# Flow Toggles - Abstract Factories
If you want to be able to switch the implementation at runtime or, you want to be able to switch the factory at runtime. In addition you want to be able to use different factories in action from within different components. 

To solve this problem you can use the abstract factory pattern instead of the static factory pattern. Rather than calling a static instance() method you first obtain a factory of a certain kind, and then ask that factory for instances. Here is how the MyClass class could look after that little change:

	public class MyClass {
	
	  IMyComponent component = null;
	
	  public MyClass() {
	    IMyComponentFactory factory =
	            MyComponentFactoryManager.getFactory("A");
	
	    component = factory.instance();
	  }
	
	  public void myMethod(){
	    component.doSomething();    
	  }
	}

And here is how the corresponding MyComponentFactoryManager and IMyComponentFactory interface would look:

	public interface IMyComponentFactory {
	  IMyComponent instance();
	}
	public class MyComponentFactoryManager {
	
	  private static Map<String, IMyComponentFactory> factories =
	      new HashMap<String, IMyComponentFactory>();
	
	  public static setFactory(
	       String factoryId, IMyComponentFactory factory){
	
	    factories.put(factoryId, factory);
	  }
	
	  public static IMyComponentFactory getFactory(String factoryId){
	    return factories.get(factoryId);
	  }
	}

As you can see, it is now possible to add, replace and remove factories at runtime.

# Flow Toggles - Dependency Injection
the responsibility of obtaining needed instances is reversed. A class no longer obtains these instances itself. Instead, a dependency injection container creates the needed instances, and "injects" them into the object.

Here is how MyClass would look when prepared for dependency injection (in its constructor):

	public class MyClass {
	
	  IMyComponent component = null;
	
	  public MyClass(IMyComponent componentImpl) {
	    component = componentImpl;
	  }
	
	  public void myMethod(){
	    component.doSomething();
	  }
	}

Now MyClass doesn't know anything about the factory classes anymore. It only knows about the IMyComponent interface. It doesn't either know whether the injected IMyComponent instance is a new instance or a cached instance. You can also easily switch the implementation injected into e.g. class MyClassA and MyClassB independently from each other.

- [DI and Factory patterns](http://tutorials.jenkov.com/dependency-injection/dependency-injection-replacing-factory-patterns.html)


# GUI Toggles 
- Dont display links on menu's etc
- create a new page (pageV2.aspx)
- code toggle

Example

	//ES2015's method shorthand	
	function createToggleRouter(featureConfig){
	  return {
	setFeature(featureName,isEnabled){
	  featureConfig[featureName] = isEnabled;
	},
	featureIsEnabled(featureName){
	  return featureConfig[featureName];
	}
	  };
	}

# Mobile
- Property lists - [plist Toggles](http://rebeloper.com/read-write-plist-file-swift/)
- [NSUserDefaults](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/#//apple_ref/doc/uid/20000318-SW1)
- Settings file

# Release/Ops Toggles 
 allow in-progress features to be checked into a shared integration branch (e.g. master or trunk) while still allowing that branch to be deployed to production at any time. Release Toggles allow incomplete and un-tested codepaths to be shipped to production as latent code which may never be turned on.

Example 

Web.config - features turned on/off
 	
	<appSettings>
	<add key="feature1StartDate" value="2016-08-01T00:01:00"/>
	<add key="feature1EndDate" value="2099-07-01T00:01:00"/>
	<add key="feature2StartDate" value="2016-07-31T00:01:00" />
    <add key="FeatureToggle.ShowMessageToggle" value="true"/>
 	</appSettings>





# Toggle Types by longevity
![]({{site.url}}/Img/featuretoggle/chart-5.png)

# References
[Martin Fowler](http://martinfowler.com/articles/feature-toggles.html)

[Plural Sight](https://www.pluralsight.com/courses/dotnet-featuretoggle-implementing)

[Feature Toggles are one of the worst kinds of Technical Debt](http://swreflections.blogspot.com/2014/08/feature-toggles-are-one-of-worst-kinds.html)