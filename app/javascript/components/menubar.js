const toggleActiveClass = ((event) => {
    const child = event.currentTarget.parentElement.children;
    Array.from(child).forEach((item) => {
      item.classList.remove('active');
    });
    event.currentTarget.classList.add('active');
  });

  const toggleActiveOnClick = (menuitem) => {
    menuitem.addEventListener('click', toggleActiveClass);
  };

const activateMenuBar = () => {
  const menuitem = document.querySelectorAll('.menu-item');
  menuitem.forEach(toggleActiveOnClick)
}

export { activateMenuBar };


  