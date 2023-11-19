# colocalization_FL
Colocalization analysis of extracellular vesicles from fluorescence images.

By Siddharth S. Sahu

Modern fluorescence microscopes allow the imaging of multiple fluorescence dyes at the same time, by using appropriate excitation sources and optical filters. However, there is a challenge. When a entity such as a cell or an extracellular vesicle is stained by multiple dyes at the same time, the dyes do not exist at the "exact same spot". There is rather a small separation between them. Hence, tere exists a small distance beyond which, the presence of two or more dyes can be assumed to belong to the same entity (i.e. they are colocalized). This distance can be determined by manually checking a few such fluorescence images, but there does not currently exist a software that can do such colocalization and estimate, for instance, the unions, intersections and other such set-theoretic operations on them, taking this separation into account. This is what my code here aspires to do.
